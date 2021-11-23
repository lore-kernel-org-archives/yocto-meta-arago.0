Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.6951.1637640072769924237
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 20:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3AE1A40C81;
	Tue, 23 Nov 2021 04:01:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJGPyrJPPVV6; Tue, 23 Nov 2021 04:01:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 219F340CAF;
	Tue, 23 Nov 2021 04:01:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1994F1746E7;
	Mon, 22 Nov 2021 23:01:06 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 07/10] Remove ability to generate build/test report per machine
Date: Mon, 22 Nov 2021 23:00:56 -0500
Message-Id: <1637640060-31733-20-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637640060-31733-1-git-send-email-denis@denix.org>
References: <1637640060-31733-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 lib/oesdk/generate-report | 295 ----------------------------------------------
 1 file changed, 295 deletions(-)
 delete mode 100644 lib/oesdk/generate-report

diff --git a/lib/oesdk/generate-report b/lib/oesdk/generate-report
deleted file mode 100644
index 86813ae..0000000
--- a/lib/oesdk/generate-report
+++ /dev/null
@@ -1,295 +0,0 @@
-#!/bin/bash
-
-# This script is intended to be called only from the top-level build-oesdk.sh
-# script which parses the configuration file and sets necessary variables.
-# So check if it is being called from any other context and if so exit.
-if [ "`basename $0`" != "build-oesdk.sh" ]
-then
-    log $error_log echo "This is a helper script and should not be run directly"
-    exit 1
-fi
-
-write_results_header() {
-cat >> $results_file << EOM
-<html>
-<head>
-<title>
-Status for `date +%D`
-</title>
-</head>
-<body>
-
-<h2>Status for `date +%D`</h2>
-
-<h2>BUILD_ID: $BUILD_ID</h2>
-
-<h2>Clean Build: $CLEAN_BUILD</h2>
-
-<h2>Clean Sources: $CLEAN_ALL</h2>
-EOM
-}
-
-write_results_footer() {
-cat >> $results_file << EOM
-
-<p>
-These builds were performed using the build-oesdk.sh script at:
-</p>
-<p>
-git://git.ti.com/arago-project/tisdk-build-scripts.git
-</p>
-
-<p>
-The configuration file passed to this script had the contents:
-</p>
-<p>
-EOM
-
-if [ "$RESULTS_CONFIG_COMMENTS" == "true" ]
-then
-    filter=""
-else
-    filter="/^[^#]/"
-fi
-
-awk "$filter { print \$0 \"<br>\"; }" $SCRIPTS_ROOT/$inputfile >> $results_file
-
-cat >> $results_file << EOM
-</p>
-
-</body>
-</html>
-EOM
-}
-
-write_repos_table() {
-cat >> $results_file << EOM
-<h2><u>Repository Revisions</u></h2>
-<table border=1 cellspacing=1 cellpadding=1>
-    <tr>
-        <th>Repository</th>
-        <th>Git URL</th>
-        <th>Branch</th>
-        <th>Commit ID</th>
-        <th>Layers</th>
-    </tr>
-
-EOM
-
-    while read line
-    do
-        # clean the parsing variables for each run
-        name=""
-        uri=""
-        branch=""
-        commit=""
-        repo_layers=""
-
-        # Skip empty lines
-        if [ "x$line" = "x" ]
-        then
-            continue
-        fi
-
-        # Skip comment lines
-        echo $line | grep -e "^#" > /dev/null
-        if [ "$?" = "0" ]
-        then
-            continue
-        fi
-
-        # If the line starts with OECORE then skip it
-        echo $line | grep -e "^OECORE.*=" > /dev/null
-        if [ "$?" = "0" ]
-        then
-            continue
-        fi
-
-        name=`echo $line | cut -d, -f1`
-        uri=`echo $line | cut -d, -f2`
-        branch=`echo $line | cut -d, -f3`
-        commit=`echo $line | cut -d, -f4`
-        repo_layers=`echo $line | cut -d, -f5-`
-
-cat >> $results_file << EOM
-    <tr>
-        <td>$name</td>
-        <td>$uri</td>
-        <td>$branch</td>
-        <td>$commit</td>
-        <td>$repo_layers</td>
-    </tr>
-EOM
-    done < $CONFIG_FILE
-
-echo "</table>" >> $results_file
-}
-
-# Set the color of the status box.  Basically if the status value has
-# "FAILED" in it anywhere then set the color to red, if the status
-# value is "SKIPPED" then set the colow to yellow, else set it to green
-set_status_color() {
-    status="$1"
-    if echo $status | grep "FAILED" > /dev/null 2>&1
-    then
-        echo "red"
-    elif echo $status | grep "SKIPPED" > /dev/null 2>&1
-    then
-        echo "yellow"
-    else
-        echo "lime"
-    fi
-}
-
-write_machine_results() {
-    m="$1"
-
-    build_result=`cat $LOG_DIR/$m-build-result.txt`
-
-    if [ "$build_result" == "PASSED" ]
-    then
-        test_result=`cat $LOG_DIR/$m-test-result.txt`
-    else
-        test_result="SKIPPED"
-    fi
-
-    build_res_color=`set_status_color $build_result`
-    test_res_color=`set_status_color $test_result`
-
-cat >> $results_file << EOM
-    <tr>
-        <td>$m</td>
-        <td id="$m-build-result" bgcolor=$build_res_color>$build_result</td>
-        <td id="$m-target-result" bgcolor=$test_res_color>$test_result</td>
-    </tr>
-EOM
-
-}
-
-write_results_table() {
-cat >> $results_file << EOM
-<h2><u>Build and Target Test Results</u></h2>
-<table border=1 cellspacing=1 cellpadding=1>
-    <tr>
-        <th>Machine</th>
-        <th>Build Result</th>
-        <th>Target Test Result</th>
-    </tr>
-EOM
-
-    for m in $MACHINES
-    do
-        write_machine_results $m
-    done
-
-echo "</table>" >> $results_file
-}
-
-write_sdk_machine_results() {
-    m="$1"
-
-    if [ -e "$LOG_DIR/$m-build-installer.txt" ]
-    then
-        installer_result=`cat $LOG_DIR/$m-build-installer.txt`
-    else
-        installer_result="SKIPPED"
-    fi
-
-    if [ -e "$LOG_DIR/$m-build-sdcard.txt" ]
-    then
-        sdcard_result=`cat $LOG_DIR/$m-build-sdcard.txt`
-    else
-        sdcard_result="SKIPPED"
-    fi
-
-    if [ -e "$LOG_DIR/$m-web-results.txt" ]
-    then
-        web_result=`cat $LOG_DIR/$m-web-results.txt`
-    else
-        web_result="SKIPPED"
-    fi
-
-    installer_res_color=`set_status_color $installer_result`
-    sdcard_res_color=`set_status_color $sdcard_result`
-    web_res_color=`set_status_color $web_result`
-
-cat >> $results_file << EOM
-    <tr>
-        <td>$m</td>
-        <td id="$m-installer-result" bgcolor=$installer_res_color>$installer_result</td>
-        <td id="$m-sdcard-result" bgcolor=$sdcard_res_color>$sdcard_result</td>
-        <td id="$m-web-result" bgcolor=$web_res_color>$web_result</td>
-    </tr>
-EOM
-
-}
-
-write_sdk_results_table() {
-cat >> $results_file << EOM
-<h2><u>SDK Build Results</u></h2>
-<table border=1 cellspacing=1 cellpadding=1>
-    <tr>
-        <th>Machine</th>
-        <th>Installer Build</th>
-        <th>SD Card Build</th>
-        <th>Web Build</th>
-    </tr>
-EOM
-
-    for m in $MACHINES
-    do
-        write_sdk_machine_results $m
-    done
-
-echo "</table>" >> $results_file
-}
-
-generate_report() {
-    results_dir="$DEPLOY_ROOT/results/$BUILD_ID"
-    results_file="$results_dir/results.html"
-
-    if [ -e $results_dir ]
-    then
-        rm -rf $results_dir
-    fi
-
-    mkdir -p $results_dir
-
-    # Copy all of the logs to the results directory
-    cp -rv $LOG_DIR $results_dir
-
-    write_results_header
-
-    write_repos_table
-
-    write_results_table
-
-    if [ "$PRODUCTIZE_SDK" == "true" ]
-    then
-        write_sdk_results_table
-    fi
-
-    write_results_footer
-
-    # TODO: Add log files to the report and be sure to copy the files to
-    #       the results_dir
-
-    # If BACKUP_RESULTS is not empty then copy the results_file to the
-    # directory it points to.
-    if [ "$BACKUP_RESULTS" != "" ]
-    then
-        mkdir -p $BACKUP_RESULTS
-        cp $results_file $BACKUP_RESULTS/
-    fi
-
-    # Lastly, for niceness sake let's create a link to the results in the
-    # SDK directory.
-    for m in $MACHINES
-    do
-        if [ -d $DEPLOY_ROOT/$m ]
-        then
-            ln -sf $results_file $DEPLOY_ROOT/$m/results.html
-        fi
-    done
-}
-
-- 
2.7.4

