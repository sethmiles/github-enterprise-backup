
backup () {
	echo "Backing up..."
	mkdir -p $1/github_backup
	now=$(date +"date%s")
	mkdir $1/github_backup/$now

 	# 'ghe-export-authorized-keys' > $1/github_backup/ghe-backup-authorized-keys.gz
	# 'ghe-export-es-indices' > $1/github_backup/ghe-backup-es-indices.tar
	# 'ghe-export-mysql' | gzip > $1/github_backup/ghe-backup-mysql.gz
	# 'ghe-export-redis' > $1/github_backup/ghe-backup-redis.rdb
	# 'ghe-export-repositories' > $1/github_backup/ghe-backup-repositories.tar
	# 'ghe-export-pages' > $1/github_backup/pages.tar
	# 'ghe-export-settings' > $1/github_backup/ghe-backup-settings.gz
	# 'ghe-export-ssh-host-keys' > $1/github_backup/ghe-backup-ssh-host-keys.tar

	echo "GitHub Enterprise backed up"

	count=0
	for item in $1/github_backup/*
	do
		$file=$item | grep "date.+"
		echo $file
		let "count++"
	done
	echo $count

}

restore () {
	echo "Restore"
}

helpList () {
	echo ""
	echo "Invalid Command $1 $2 $3 $4 $5"
	echo ""
	echo "This script accepts only the arguments listed below"
	echo "-backup		Creates a backup of github enterprise"
	echo "-Restore   	Restores github enterprise from a backup"
	echo ""
	echo "The location of the output of the backup and the folder location"
	echo "for the restore must be passed in as the second argument for each"
	echo "each function"
	echo ""
}

if [[ "$1" == "-backup" ]]
then
	#command -v 'ghe-export-authorized-keys' >/dev/null 2>&1 || { echo >&2 "GitHub command line tools not detected, aborting backup."; exit 1; }
	backup $2
elif [[ "$1" == "-restore" ]]
then
	#command -v 'ghe-export-authorized-keys' >/dev/null 2>&1 || { echo >&2 "GitHub command line tools not detected, aborting restore."; exit 1; }
	restore
else 
	helpList $1 $2 $3 $4 $5
fi

