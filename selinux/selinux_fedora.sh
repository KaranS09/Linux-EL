#!/bin/bash

echo "🔍 Checking if SELinux is installed..."
if ! command -v sestatus &> /dev/null; then
    echo "⚠️ SELinux not found! Installing..."
    sudo dnf install -y selinux-policy selinux-policy-targeted policycoreutils policycoreutils-python-utils
fi

echo "✅ Enabling SELinux..."
sudo setenforce 1
sestatus

echo "🛡️ Creating a secure directory with SELinux policy..."
mkdir -p /secure_data
touch /secure_data/secret.txt
echo "Confidential Information" > /secure_data/secret.txt

echo "🔒 Setting SELinux security context..."
sudo chcon -t user_home_t /secure_data
sudo chcon -t user_home_t /secure_data/secret.txt

echo "📝 Defining a Custom SELinux Policy..."
cat <<EOF > custom_policy.te
module custom_policy 1.0;

require {
    type user_home_t;
    class file { read write };
}

allow user_home_t self:file { read write };
EOF

echo "⚙️ Compiling & Applying SELinux Policy..."
checkmodule -M -m -o custom_policy.mod custom_policy.te
semodule_package -o custom_policy.pp -m custom_policy.mod
sudo semodule -i custom_policy.pp

echo "📜 Listing SELinux Contexts..."
ls -Z /secure_data

echo "📢 Monitoring Security Violations..."
sudo ausearch -m AVC,USER_AUTH | tee selinux_logs.txt

echo "✅ SELinux configuration complete!"

