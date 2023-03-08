Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF78AC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 00:38:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.11248.1678235880130879949
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 16:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DloXBDMK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3280buon061240;
	Tue, 7 Mar 2023 18:37:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678235876;
	bh=vOk5U9eHwb6p9k01Nlh6eb7GluoMMN9/8EkQ5IfgLPU=;
	h=From:To:Subject:Date;
	b=DloXBDMKpeXMtBe6uRc617Nj4KN8oBUpCzaIv/jtKv0FoJoKqY1t2WqiG3jrs0RK8
	 n58tTUyjgAWyJX5S8pMbkXwp2+XxnCEL623WrgqBkv7xAHUaqvPUOkR8TTjgAOH9Cz
	 cC/xi88Gnvku7vEyb1ILoRXwhvbCNkkO59n8l5Nw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3280buHP067587
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Mar 2023 18:37:56 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Mar 2023 18:37:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Mar 2023 18:37:56 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3280buYf039740;
	Tue, 7 Mar 2023 18:37:56 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pZhoa-0006zp-39; Tue, 07 Mar 2023 18:37:56 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] oe-layertool-setup.sh: local.conf settings in config file
Date: Tue, 7 Mar 2023 18:37:56 -0600
Message-ID: <20230308003756.26853-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Mar 2023 00:38:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14254

For some layersetup scenarios, it might be advantageous to allow for
settings that should go into the local.conf file for a given set of
layers.  To that end, any line starting with LOCALCONF: will be appended
to the end of the local.conf.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 oe-layertool-setup.sh | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index df1b675..4e66093 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -166,6 +166,13 @@ parse_bitbake_line() {
     eval $var=$val
 }
 
+# Input is a line of the form LOCALCONF:.*=value
+parse_localconf_line() {
+    localconf=`echo "$1" | cut -d: -f2`
+    echo "$localconf" >> $oebase/tmp_append_local.conf
+}
+
+
 
 
 # Input is a repository description line as detailed in the usage section
@@ -221,6 +228,11 @@ parse_repo_line() {
 
 
 parse_input_file() {
+    if [ -e $oebase/tmp_append_local.conf ]
+    then
+        rm $oebase/tmp_append_local.conf
+    fi
+
     while read line
     do
         # clean the parsing variables for each run
@@ -252,7 +264,7 @@ parse_input_file() {
             continue
         fi
 
-        # If the line starts with OECORE then parse the OECORE setting
+        # If the line starts with BITBAKE then parse the BITBAKE setting
         echo $line | grep -e "^BITBAKE.*=" > /dev/null
         if [ "$?" = "0" ]
         then
@@ -261,6 +273,14 @@ parse_input_file() {
             continue
         fi
 
+        # If the line starts with LOCALCONF: then parse the LOCALCONF: setting
+        echo $line | grep -e "^LOCALCONF:.*" > /dev/null
+        if [ "$?" = "0" ]
+        then
+            parse_localconf_line "$line"
+            output="$output""$line\n"
+            continue
+        fi
         # Since the line is not a comment or an OECORE setting let's assume
         # it is a repository information line and parse it
         parse_repo_line $line
@@ -783,6 +803,21 @@ EOM
     fi
 
     sed -i "s|^DL_DIR.*|DL_DIR = \"${dldir}\"|" $confdir/local.conf
+
+    if [ -e $oebase/tmp_append_local.conf ]
+    then
+        echo "" >> $confdir/local.conf
+        echo "#====================================================================" >> $confdir/local.conf
+        echo "# LOCALCONF: settings from config file:" >> $confdir/local.conf
+        echo "#   $inputfile" >> $confdir/local.conf
+        echo "#" >> $confdir/local.conf
+        echo "# Do not remove." >> $confdir/local.conf
+        echo "#--------------------------------------------------------------------" >> $confdir/local.conf
+        cat $oebase/tmp_append_local.conf >> $confdir/local.conf
+        echo "#====================================================================" >> $confdir/local.conf
+        echo "" >>  $confdir/local.conf
+        rm $oebase/tmp_append_local.conf
+    fi
 }
 
 print_image_names() {
-- 
2.17.1


