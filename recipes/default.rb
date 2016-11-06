package 'htop'
package 'vim'
package 'unzip'
package 'mc'

# Add a banner to ssh login if we're in the production environment
if node[:environment] == 'production'
  sshd_config = '/etc/ssh/sshd_config'

  seds = []
  echos = ["\n"]

  banner_path = '/etc/ssh_banner'

  seds << 's/^Banner/#Banner/g'
  echos << "Banner #{banner_path}"

  template banner_path do
    owner 'root'
    group 'root'
    mode '0644'
    source 'production_ssh_banner.erb'
  end

  bash 'Adding visual flags for production environment' do
    user 'root'
    code <<-EOC
      #{seds.map { |rx| "sed -i '#{rx}' #{sshd_config}" }.join("\n")}
      #{echos.map { |e| %Q{echo "#{e}" >> #{sshd_config}} }.join("\n")}
    EOC
  end

  service 'ssh' do
    # provider Chef::Provider::Service::Upstart
    # supports :restart => true
    # start_command "service ssh start"
    # restart_command "service ssh restart"
    action :restart
  end
end
