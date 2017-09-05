class arc_local {

#  Dont kill because of job memory limit   
   file { '/usr/share/arc/submit-condor-job':
    ensure => present,
    source => "puppet:///modules/${module_name}/submit-condor-job",
    backup => ".bak.${now}",
    mode   => '0755',
  }
  
  file { '/usr/share/arc/Condor.pm':
    ensure => present,
    source => "puppet:///modules/${module_name}/Condor.pm",
    backup => ".bak.${now}",
    mode   => '0644',
  }
  
 # To publish VO's share as mentioned in Gang mail and for Alice requirement
  file { '/usr/share/arc/glue-generator.pl':
    ensure => present,
    source => "puppet:///modules/${module_name}/glue-generator.pl",
    backup => ".bak.${now}",
    mode   => '0644',
  }

 # Jobshare per VO : Alice requirement and script provided by Andrew
  file { '/usr/local/bin/condor_jobshare':
    ensure => present,
    source => "puppet:///modules/${module_name}/condor_jobshare",
    backup => ".bak.${now}",
    mode   => '0655',
  }
  
  file { '/etc/cron.d/jobshare_cron':
    ensure => present,
    source => "puppet:///modules/${module_name}/jobshare_cron",
    backup => ".bak.${now}",
    mode   => 0644
  }



}
