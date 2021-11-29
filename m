Subject: Re: [tisdk-build-scripts][PATCH 07/10] Remove ability to generate build/test report per machine
To: meta-arago@lists.yoctoproject.org
From: "Jonathan Humphreys" <j-humphreys@ti.com>
X-Originating-Location: US (192.228.67.13)
X-Originating-Platform: Windows Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 15:15:12 -0800
References: <1637640060-31733-20-git-send-email-denis@denix.org>
In-Reply-To: <1637640060-31733-20-git-send-email-denis@denix.org>
Message-ID: <22100.1638227712671833412@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="UF5HlUKev27PJG7suER0"

--UF5HlUKev27PJG7suER0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:

>=20
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Jonathan Humphreys <j-humphreys@ti.com>

>=20
> ---
> lib/oesdk/generate-report | 295
> ----------------------------------------------
> 1 file changed, 295 deletions(-)
> delete mode 100644 lib/oesdk/generate-report
>=20
> diff --git a/lib/oesdk/generate-report b/lib/oesdk/generate-report
> deleted file mode 100644
> index 86813ae..0000000
> --- a/lib/oesdk/generate-report
> +++ /dev/null
> @@ -1,295 +0,0 @@
> -#!/bin/bash
> -
> -# This script is intended to be called only from the top-level
> build-oesdk.sh
> -# script which parses the configuration file and sets necessary
> variables.
> -# So check if it is being called from any other context and if so exit.
> -if [ "`basename $0`" !=3D "build-oesdk.sh" ]
> -then
> - log $error_log echo "This is a helper script and should not be run
> directly"
> - exit 1
> -fi
> -
> -write_results_header() {
> -cat >> $results_file << EOM
> -<html>
> -<head>
> -<title>
> -Status for `date +%D`
> -</title>
> -</head>
> -<body>
> -
> -<h2>Status for `date +%D`</h2>
> -
> -<h2>BUILD_ID: $BUILD_ID</h2>
> -
> -<h2>Clean Build: $CLEAN_BUILD</h2>
> -
> -<h2>Clean Sources: $CLEAN_ALL</h2>
> -EOM
> -}
> -
> -write_results_footer() {
> -cat >> $results_file << EOM
> -
> -<p>
> -These builds were performed using the build-oesdk.sh script at:
> -</p>
> -<p>
> -git://git.ti.com/arago-project/tisdk-build-scripts.git
> -</p>
> -
> -<p>
> -The configuration file passed to this script had the contents:
> -</p>
> -<p>
> -EOM
> -
> -if [ "$RESULTS_CONFIG_COMMENTS" =3D=3D "true" ]
> -then
> - filter=3D""
> -else
> - filter=3D"/^[^#]/"
> -fi
> -
> -awk "$filter { print \$0 \"<br>\"; }" $SCRIPTS_ROOT/$inputfile >>
> $results_file
> -
> -cat >> $results_file << EOM
> -</p>
> -
> -</body>
> -</html>
> -EOM
> -}
> -
> -write_repos_table() {
> -cat >> $results_file << EOM
> -<h2><u>Repository Revisions</u></h2>
> -<table border=3D1 cellspacing=3D1 cellpadding=3D1>
> - <tr>
> - <th>Repository</th>
> - <th>Git URL</th>
> - <th>Branch</th>
> - <th>Commit ID</th>
> - <th>Layers</th>
> - </tr>
> -
> -EOM
> -
> - while read line
> - do
> - # clean the parsing variables for each run
> - name=3D""
> - uri=3D""
> - branch=3D""
> - commit=3D""
> - repo_layers=3D""
> -
> - # Skip empty lines
> - if [ "x$line" =3D "x" ]
> - then
> - continue
> - fi
> -
> - # Skip comment lines
> - echo $line | grep -e "^#" > /dev/null
> - if [ "$?" =3D "0" ]
> - then
> - continue
> - fi
> -
> - # If the line starts with OECORE then skip it
> - echo $line | grep -e "^OECORE.*=3D" > /dev/null
> - if [ "$?" =3D "0" ]
> - then
> - continue
> - fi
> -
> - name=3D`echo $line | cut -d, -f1`
> - uri=3D`echo $line | cut -d, -f2`
> - branch=3D`echo $line | cut -d, -f3`
> - commit=3D`echo $line | cut -d, -f4`
> - repo_layers=3D`echo $line | cut -d, -f5-`
> -
> -cat >> $results_file << EOM
> - <tr>
> - <td>$name</td>
> - <td>$uri</td>
> - <td>$branch</td>
> - <td>$commit</td>
> - <td>$repo_layers</td>
> - </tr>
> -EOM
> - done < $CONFIG_FILE
> -
> -echo "</table>" >> $results_file
> -}
> -
> -# Set the color of the status box. Basically if the status value has
> -# "FAILED" in it anywhere then set the color to red, if the status
> -# value is "SKIPPED" then set the colow to yellow, else set it to green
> -set_status_color() {
> - status=3D"$1"
> - if echo $status | grep "FAILED" > /dev/null 2>&1
> - then
> - echo "red"
> - elif echo $status | grep "SKIPPED" > /dev/null 2>&1
> - then
> - echo "yellow"
> - else
> - echo "lime"
> - fi
> -}
> -
> -write_machine_results() {
> - m=3D"$1"
> -
> - build_result=3D`cat $LOG_DIR/$m-build-result.txt`
> -
> - if [ "$build_result" =3D=3D "PASSED" ]
> - then
> - test_result=3D`cat $LOG_DIR/$m-test-result.txt`
> - else
> - test_result=3D"SKIPPED"
> - fi
> -
> - build_res_color=3D`set_status_color $build_result`
> - test_res_color=3D`set_status_color $test_result`
> -
> -cat >> $results_file << EOM
> - <tr>
> - <td>$m</td>
> - <td id=3D"$m-build-result" bgcolor=3D$build_res_color>$build_result</td=
>
> - <td id=3D"$m-target-result" bgcolor=3D$test_res_color>$test_result</td>
> - </tr>
> -EOM
> -
> -}
> -
> -write_results_table() {
> -cat >> $results_file << EOM
> -<h2><u>Build and Target Test Results</u></h2>
> -<table border=3D1 cellspacing=3D1 cellpadding=3D1>
> - <tr>
> - <th>Machine</th>
> - <th>Build Result</th>
> - <th>Target Test Result</th>
> - </tr>
> -EOM
> -
> - for m in $MACHINES
> - do
> - write_machine_results $m
> - done
> -
> -echo "</table>" >> $results_file
> -}
> -
> -write_sdk_machine_results() {
> - m=3D"$1"
> -
> - if [ -e "$LOG_DIR/$m-build-installer.txt" ]
> - then
> - installer_result=3D`cat $LOG_DIR/$m-build-installer.txt`
> - else
> - installer_result=3D"SKIPPED"
> - fi
> -
> - if [ -e "$LOG_DIR/$m-build-sdcard.txt" ]
> - then
> - sdcard_result=3D`cat $LOG_DIR/$m-build-sdcard.txt`
> - else
> - sdcard_result=3D"SKIPPED"
> - fi
> -
> - if [ -e "$LOG_DIR/$m-web-results.txt" ]
> - then
> - web_result=3D`cat $LOG_DIR/$m-web-results.txt`
> - else
> - web_result=3D"SKIPPED"
> - fi
> -
> - installer_res_color=3D`set_status_color $installer_result`
> - sdcard_res_color=3D`set_status_color $sdcard_result`
> - web_res_color=3D`set_status_color $web_result`
> -
> -cat >> $results_file << EOM
> - <tr>
> - <td>$m</td>
> - <td id=3D"$m-installer-result"
> bgcolor=3D$installer_res_color>$installer_result</td>
> - <td id=3D"$m-sdcard-result" bgcolor=3D$sdcard_res_color>$sdcard_result<=
/td>
> - <td id=3D"$m-web-result" bgcolor=3D$web_res_color>$web_result</td>
> - </tr>
> -EOM
> -
> -}
> -
> -write_sdk_results_table() {
> -cat >> $results_file << EOM
> -<h2><u>SDK Build Results</u></h2>
> -<table border=3D1 cellspacing=3D1 cellpadding=3D1>
> - <tr>
> - <th>Machine</th>
> - <th>Installer Build</th>
> - <th>SD Card Build</th>
> - <th>Web Build</th>
> - </tr>
> -EOM
> -
> - for m in $MACHINES
> - do
> - write_sdk_machine_results $m
> - done
> -
> -echo "</table>" >> $results_file
> -}
> -
> -generate_report() {
> - results_dir=3D"$DEPLOY_ROOT/results/$BUILD_ID"
> - results_file=3D"$results_dir/results.html"
> -
> - if [ -e $results_dir ]
> - then
> - rm -rf $results_dir
> - fi
> -
> - mkdir -p $results_dir
> -
> - # Copy all of the logs to the results directory
> - cp -rv $LOG_DIR $results_dir
> -
> - write_results_header
> -
> - write_repos_table
> -
> - write_results_table
> -
> - if [ "$PRODUCTIZE_SDK" =3D=3D "true" ]
> - then
> - write_sdk_results_table
> - fi
> -
> - write_results_footer
> -
> - # TODO: Add log files to the report and be sure to copy the files to
> - # the results_dir
> -
> - # If BACKUP_RESULTS is not empty then copy the results_file to the
> - # directory it points to.
> - if [ "$BACKUP_RESULTS" !=3D "" ]
> - then
> - mkdir -p $BACKUP_RESULTS
> - cp $results_file $BACKUP_RESULTS/
> - fi
> -
> - # Lastly, for niceness sake let's create a link to the results in the
> - # SDK directory.
> - for m in $MACHINES
> - do
> - if [ -d $DEPLOY_ROOT/$m ]
> - then
> - ln -sf $results_file $DEPLOY_ROOT/$m/results.html
> - fi
> - done
> -}
> -
> --
> 2.7.4

--UF5HlUKev27PJG7suER0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 08:01 PM, Denys Dmytriyenko wrote:<br />
<blockquote>From: Denys Dmytriyenko &lt;denys@konsulko.com&gt;<br /><br />S=
igned-off-by: Denys Dmytriyenko &lt;denys@konsulko.com&gt;</blockquote>
<span style=3D"white-space: pre-wrap;">Reviewed-by: Jonathan Humphreys &lt;=
j-humphreys@ti.com&gt;</span><br />
<blockquote>---<br />lib/oesdk/generate-report | 295 ----------------------=
------------------------<br />1 file changed, 295 deletions(-)<br />delete =
mode 100644 lib/oesdk/generate-report<br /><br />diff --git a/lib/oesdk/gen=
erate-report b/lib/oesdk/generate-report<br />deleted file mode 100644<br /=
>index 86813ae..0000000<br />--- a/lib/oesdk/generate-report<br />+++ /dev/=
null<br />@@ -1,295 +0,0 @@<br />-#!/bin/bash<br />-<br />-# This script is=
 intended to be called only from the top-level build-oesdk.sh<br />-# scrip=
t which parses the configuration file and sets necessary variables.<br />-#=
 So check if it is being called from any other context and if so exit.<br /=
>-if [ "`basename $0`" !=3D "build-oesdk.sh" ]<br />-then<br />- log $error=
_log echo "This is a helper script and should not be run directly"<br />- e=
xit 1<br />-fi<br />-<br />-write_results_header() {<br />-cat &gt;&gt; $re=
sults_file &lt;&lt; EOM<br />-&lt;html&gt;<br />-&lt;head&gt;<br />-&lt;tit=
le&gt;<br />-Status for `date +%D`<br />-&lt;/title&gt;<br />-&lt;/head&gt;=
<br />-&lt;body&gt;<br />-<br />-&lt;h2&gt;Status for `date +%D`&lt;/h2&gt;=
<br />-<br />-&lt;h2&gt;BUILD_ID: $BUILD_ID&lt;/h2&gt;<br />-<br />-&lt;h2&=
gt;Clean Build: $CLEAN_BUILD&lt;/h2&gt;<br />-<br />-&lt;h2&gt;Clean Source=
s: $CLEAN_ALL&lt;/h2&gt;<br />-EOM<br />-}<br />-<br />-write_results_foote=
r() {<br />-cat &gt;&gt; $results_file &lt;&lt; EOM<br />-<br />-&lt;p&gt;<=
br />-These builds were performed using the build-oesdk.sh script at:<br />=
-&lt;/p&gt;<br />-&lt;p&gt;<br />-git://git.ti.com/arago-project/tisdk-buil=
d-scripts.git<br />-&lt;/p&gt;<br />-<br />-&lt;p&gt;<br />-The configurati=
on file passed to this script had the contents:<br />-&lt;/p&gt;<br />-&lt;=
p&gt;<br />-EOM<br />-<br />-if [ "$RESULTS_CONFIG_COMMENTS" =3D=3D "true" =
]<br />-then<br />- filter=3D""<br />-else<br />- filter=3D"/^[^#]/"<br />-=
fi<br />-<br />-awk "$filter { print \$0 \"&lt;br&gt;\"; }" $SCRIPTS_ROOT/$=
inputfile &gt;&gt; $results_file<br />-<br />-cat &gt;&gt; $results_file &l=
t;&lt; EOM<br />-&lt;/p&gt;<br />-<br />-&lt;/body&gt;<br />-&lt;/html&gt;<=
br />-EOM<br />-}<br />-<br />-write_repos_table() {<br />-cat &gt;&gt; $re=
sults_file &lt;&lt; EOM<br />-&lt;h2&gt;&lt;u&gt;Repository Revisions&lt;/u=
&gt;&lt;/h2&gt;<br />-&lt;table border=3D1 cellspacing=3D1 cellpadding=3D1&=
gt;<br />- &lt;tr&gt;<br />- &lt;th&gt;Repository&lt;/th&gt;<br />- &lt;th&=
gt;Git URL&lt;/th&gt;<br />- &lt;th&gt;Branch&lt;/th&gt;<br />- &lt;th&gt;C=
ommit ID&lt;/th&gt;<br />- &lt;th&gt;Layers&lt;/th&gt;<br />- &lt;/tr&gt;<b=
r />-<br />-EOM<br />-<br />- while read line<br />- do<br />- # clean the =
parsing variables for each run<br />- name=3D""<br />- uri=3D""<br />- bran=
ch=3D""<br />- commit=3D""<br />- repo_layers=3D""<br />-<br />- # Skip emp=
ty lines<br />- if [ "x$line" =3D "x" ]<br />- then<br />- continue<br />- =
fi<br />-<br />- # Skip comment lines<br />- echo $line | grep -e "^#" &gt;=
 /dev/null<br />- if [ "$?" =3D "0" ]<br />- then<br />- continue<br />- fi=
<br />-<br />- # If the line starts with OECORE then skip it<br />- echo $l=
ine | grep -e "^OECORE.*=3D" &gt; /dev/null<br />- if [ "$?" =3D "0" ]<br /=
>- then<br />- continue<br />- fi<br />-<br />- name=3D`echo $line | cut -d=
, -f1`<br />- uri=3D`echo $line | cut -d, -f2`<br />- branch=3D`echo $line =
| cut -d, -f3`<br />- commit=3D`echo $line | cut -d, -f4`<br />- repo_layer=
s=3D`echo $line | cut -d, -f5-`<br />-<br />-cat &gt;&gt; $results_file &lt=
;&lt; EOM<br />- &lt;tr&gt;<br />- &lt;td&gt;$name&lt;/td&gt;<br />- &lt;td=
&gt;$uri&lt;/td&gt;<br />- &lt;td&gt;$branch&lt;/td&gt;<br />- &lt;td&gt;$c=
ommit&lt;/td&gt;<br />- &lt;td&gt;$repo_layers&lt;/td&gt;<br />- &lt;/tr&gt=
;<br />-EOM<br />- done &lt; $CONFIG_FILE<br />-<br />-echo "&lt;/table&gt;=
" &gt;&gt; $results_file<br />-}<br />-<br />-# Set the color of the status=
 box. Basically if the status value has<br />-# "FAILED" in it anywhere the=
n set the color to red, if the status<br />-# value is "SKIPPED" then set t=
he colow to yellow, else set it to green<br />-set_status_color() {<br />- =
status=3D"$1"<br />- if echo $status | grep "FAILED" &gt; /dev/null 2&gt;&a=
mp;1<br />- then<br />- echo "red"<br />- elif echo $status | grep "SKIPPED=
" &gt; /dev/null 2&gt;&amp;1<br />- then<br />- echo "yellow"<br />- else<b=
r />- echo "lime"<br />- fi<br />-}<br />-<br />-write_machine_results() {<=
br />- m=3D"$1"<br />-<br />- build_result=3D`cat $LOG_DIR/$m-build-result.=
txt`<br />-<br />- if [ "$build_result" =3D=3D "PASSED" ]<br />- then<br />=
- test_result=3D`cat $LOG_DIR/$m-test-result.txt`<br />- else<br />- test_r=
esult=3D"SKIPPED"<br />- fi<br />-<br />- build_res_color=3D`set_status_col=
or $build_result`<br />- test_res_color=3D`set_status_color $test_result`<b=
r />-<br />-cat &gt;&gt; $results_file &lt;&lt; EOM<br />- &lt;tr&gt;<br />=
- &lt;td&gt;$m&lt;/td&gt;<br />- &lt;td id=3D"$m-build-result" bgcolor=3D$b=
uild_res_color&gt;$build_result&lt;/td&gt;<br />- &lt;td id=3D"$m-target-re=
sult" bgcolor=3D$test_res_color&gt;$test_result&lt;/td&gt;<br />- &lt;/tr&g=
t;<br />-EOM<br />-<br />-}<br />-<br />-write_results_table() {<br />-cat =
&gt;&gt; $results_file &lt;&lt; EOM<br />-&lt;h2&gt;&lt;u&gt;Build and Targ=
et Test Results&lt;/u&gt;&lt;/h2&gt;<br />-&lt;table border=3D1 cellspacing=
=3D1 cellpadding=3D1&gt;<br />- &lt;tr&gt;<br />- &lt;th&gt;Machine&lt;/th&=
gt;<br />- &lt;th&gt;Build Result&lt;/th&gt;<br />- &lt;th&gt;Target Test R=
esult&lt;/th&gt;<br />- &lt;/tr&gt;<br />-EOM<br />-<br />- for m in $MACHI=
NES<br />- do<br />- write_machine_results $m<br />- done<br />-<br />-echo=
 "&lt;/table&gt;" &gt;&gt; $results_file<br />-}<br />-<br />-write_sdk_mac=
hine_results() {<br />- m=3D"$1"<br />-<br />- if [ -e "$LOG_DIR/$m-build-i=
nstaller.txt" ]<br />- then<br />- installer_result=3D`cat $LOG_DIR/$m-buil=
d-installer.txt`<br />- else<br />- installer_result=3D"SKIPPED"<br />- fi<=
br />-<br />- if [ -e "$LOG_DIR/$m-build-sdcard.txt" ]<br />- then<br />- s=
dcard_result=3D`cat $LOG_DIR/$m-build-sdcard.txt`<br />- else<br />- sdcard=
_result=3D"SKIPPED"<br />- fi<br />-<br />- if [ -e "$LOG_DIR/$m-web-result=
s.txt" ]<br />- then<br />- web_result=3D`cat $LOG_DIR/$m-web-results.txt`<=
br />- else<br />- web_result=3D"SKIPPED"<br />- fi<br />-<br />- installer=
_res_color=3D`set_status_color $installer_result`<br />- sdcard_res_color=
=3D`set_status_color $sdcard_result`<br />- web_res_color=3D`set_status_col=
or $web_result`<br />-<br />-cat &gt;&gt; $results_file &lt;&lt; EOM<br />-=
 &lt;tr&gt;<br />- &lt;td&gt;$m&lt;/td&gt;<br />- &lt;td id=3D"$m-installer=
-result" bgcolor=3D$installer_res_color&gt;$installer_result&lt;/td&gt;<br =
/>- &lt;td id=3D"$m-sdcard-result" bgcolor=3D$sdcard_res_color&gt;$sdcard_r=
esult&lt;/td&gt;<br />- &lt;td id=3D"$m-web-result" bgcolor=3D$web_res_colo=
r&gt;$web_result&lt;/td&gt;<br />- &lt;/tr&gt;<br />-EOM<br />-<br />-}<br =
/>-<br />-write_sdk_results_table() {<br />-cat &gt;&gt; $results_file &lt;=
&lt; EOM<br />-&lt;h2&gt;&lt;u&gt;SDK Build Results&lt;/u&gt;&lt;/h2&gt;<br=
 />-&lt;table border=3D1 cellspacing=3D1 cellpadding=3D1&gt;<br />- &lt;tr&=
gt;<br />- &lt;th&gt;Machine&lt;/th&gt;<br />- &lt;th&gt;Installer Build&lt=
;/th&gt;<br />- &lt;th&gt;SD Card Build&lt;/th&gt;<br />- &lt;th&gt;Web Bui=
ld&lt;/th&gt;<br />- &lt;/tr&gt;<br />-EOM<br />-<br />- for m in $MACHINES=
<br />- do<br />- write_sdk_machine_results $m<br />- done<br />-<br />-ech=
o "&lt;/table&gt;" &gt;&gt; $results_file<br />-}<br />-<br />-generate_rep=
ort() {<br />- results_dir=3D"$DEPLOY_ROOT/results/$BUILD_ID"<br />- result=
s_file=3D"$results_dir/results.html"<br />-<br />- if [ -e $results_dir ]<b=
r />- then<br />- rm -rf $results_dir<br />- fi<br />-<br />- mkdir -p $res=
ults_dir<br />-<br />- # Copy all of the logs to the results directory<br /=
>- cp -rv $LOG_DIR $results_dir<br />-<br />- write_results_header<br />-<b=
r />- write_repos_table<br />-<br />- write_results_table<br />-<br />- if =
[ "$PRODUCTIZE_SDK" =3D=3D "true" ]<br />- then<br />- write_sdk_results_ta=
ble<br />- fi<br />-<br />- write_results_footer<br />-<br />- # TODO: Add =
log files to the report and be sure to copy the files to<br />- # the resul=
ts_dir<br />-<br />- # If BACKUP_RESULTS is not empty then copy the results=
_file to the<br />- # directory it points to.<br />- if [ "$BACKUP_RESULTS"=
 !=3D "" ]<br />- then<br />- mkdir -p $BACKUP_RESULTS<br />- cp $results_f=
ile $BACKUP_RESULTS/<br />- fi<br />-<br />- # Lastly, for niceness sake le=
t's create a link to the results in the<br />- # SDK directory.<br />- for =
m in $MACHINES<br />- do<br />- if [ -d $DEPLOY_ROOT/$m ]<br />- then<br />=
- ln -sf $results_file $DEPLOY_ROOT/$m/results.html<br />- fi<br />- done<b=
r />-}<br />-<br />-- <br />2.7.4</blockquote>

--UF5HlUKev27PJG7suER0--
