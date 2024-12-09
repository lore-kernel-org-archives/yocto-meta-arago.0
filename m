Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836AAE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 16:57:43 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.106746.1733763455139264629
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 08:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JiMyTbYP;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9GvXbH2538514
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Dec 2024 10:57:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733763453;
	bh=l+tbc25gQcWKnN6gicAFQ7ZK3JvkQWkIVl13B1yhPas=;
	h=From:To:Subject:Date;
	b=JiMyTbYPZ10w8wftTWFfqdqr8gpkiyvyC0PB5AOAUViK+DY9iPI8iUTv0NoI20YSp
	 ffj1//ZbWtW7epJr3SWezOGLwczYgDEGCiBtHNXSw5i/mkffvhcYoa/VL0tIDAHuoA
	 IGsncNu27S9ydYHMeM4q6hftsxyqRU0prvA2+Zqs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9GvXY4026972
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Dec 2024 10:57:33 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 10:57:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 10:57:33 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9GvXw4051343;
	Mon, 9 Dec 2024 10:57:33 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tKh4f-0005aQ-1j; Mon, 09 Dec 2024 10:57:33 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] src/bin/convert.pl: Add manual input mode
Date: Mon, 9 Dec 2024 10:57:33 -0600
Message-ID: <20241209165733.21435-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Dec 2024 16:57:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15649

This changes the one-off convert script into a usable utility for
importing any oe-layersetup config into the new XML config.  This will
be helpful for easily creating the versioned SDK release configs from
the oe-layersetup config that was used to create the SDK release.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 src/bin/convert.pl | 295 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 259 insertions(+), 36 deletions(-)

diff --git a/src/bin/convert.pl b/src/bin/convert.pl
index 9f154a4..2787b86 100755
--- a/src/bin/convert.pl
+++ b/src/bin/convert.pl
@@ -1,20 +1,64 @@
 #!/usr/bin/perl
 
+use FindBin qw($RealBin);
+
 use strict;
 
+$|=1;
+
+use Cwd;
+use FileHandle;
+use Getopt::Long;
+
 #
-# This is a one-time script to convert the current oe-layersetup configs into
+# This is a script to convert the current oe-layersetup configs into
 # the new XML format.  Current version only converts kirkstone, scarthgap, and
 # master configs.
 #
-# NOTE: Paths are setup for this script to be run in the src/ directory
-#
+
+my $glRootDir = realpath("${RealBin}/../..");
+my $glSrcDir = "${glRootDir}/src";
+my $glSrcConfigsDir = "${glSrcDir}/configs";
+
+my %glArgs;
+$glArgs{distro} = "arago";
+&GetOptions(\%glArgs,
+            "input=s",
+            "config-name=s",
+            "distro=s",
+            "import-existing",
+            "force",
+            "debug",
+            "dry-run",
+            "help"
+           );
+
+if (exists($glArgs{help}))
+{
+    usage();
+    exit();
+}
+
 
 my %glReferencedBblayersConf;
 my %glReferencedLocalConf;
 
-convert_configs("configs");
-#convert_templates("../sample-files");
+if (exists($glArgs{input}))
+{
+    if (-f $glArgs{input})
+    {
+        convert_config($glArgs{input}, "input");
+    }
+    else
+    {
+        print STDERR "ERROR: --input points to an invalid file: $glArgs{input}\n";
+        exit(1);
+    }
+}
+elsif (exists($glArgs{'import-existing'}))
+{
+    convert_configs("${glRootDir}/configs");
+}
 
 foreach my $lpBblayersConf (keys(%glReferencedBblayersConf))
 {
@@ -26,13 +70,16 @@ foreach my $lpLocalConf (keys(%glReferencedLocalConf))
     convert_local_conf_template($lpLocalConf);
 }
 
+
 sub convert_configs
 {
+    debug("convert_configs() - start");
+
     my $arDir = shift;
 
-    #print "convert_configs: $arDir\n";
+    debug("convert_configs() - arDir=$arDir");
 
-    opendir(DIR, "../${arDir}");
+    opendir(DIR, $arDir);
     my @loFiles = readdir(DIR);
     closedir(DIR);
 
@@ -40,33 +87,50 @@ sub convert_configs
     {
         next if ($lpFile =~ /^\.\.?$/);
 
-        #print "convert_configs: check: $arDir/$lpFile\n";
+        debug("convert_configs() -   check: $arDir/$lpFile");
 
-        if (-d "../${arDir}/${lpFile}")
+        if (-d "${arDir}/${lpFile}")
         {
             convert_configs("${arDir}/${lpFile}");
         }
         elsif ($lpFile =~ /\.txt$/)
         {
-            convert_config("${arDir}/${lpFile}");
+            convert_config("${arDir}/${lpFile}", "import");
         }
     }
+    debug("convert_configs() - stop");
 }
 
 sub convert_config
 {
+    debug("convert_config() - start");
+
     my $arFile = shift;
+    my $arMode = shift;
+    
+    debug("convert_config() -   arFile=${arFile}");
+    debug("convert_config() -   arMode=${arMode}");
 
-    my $loConfigName = $arFile;
-    $loConfigName =~ s/\.txt$//;
-    $loConfigName =~ s/configs\///;
+    my $loInputFileFPFN = realpath($arFile);
 
-    my $loTargetFPFN = $arFile;
-    $loTargetFPFN =~ s/\.txt$/.xml/;
+    debug("convert_config() -   loInputFileFPFN=${loInputFileFPFN}");
 
-    my ($loTargetDir) = ($loTargetFPFN =~ /^(.+?)\/[^\/]+$/);
+    my $loConfigName;
+    if (exists($glArgs{'config-name'}) && ($arMode ne "import"))
+    {
+        $loConfigName = $glArgs{'config-name'};
+    }
+    else
+    {
+        $loConfigName = $loInputFileFPFN;
+        $loConfigName =~ s{$glRootDir/}//;
+        $loConfigName =~ s/^configs\///;
+        $loConfigName =~ s/\.txt$//;
+    }
 
-    open(CFG, "../${arFile}");
+    debug("convert_config() -   loConfigName=${loConfigName}");
+
+    open(CFG, "${loInputFileFPFN}");
     my @loLines = <CFG>;
     close(CFG);
 
@@ -92,7 +156,16 @@ sub convert_config
         return;
     }
 
-    print "convert: ${arFile} -> ${loTargetFPFN}\n";
+    #-------------------------------------------------------------------------
+    # Setup the output file
+    #-------------------------------------------------------------------------
+    my $loTargetFPFN = "$glSrcConfigsDir/${loConfigName}.xml";
+
+    debug("convert_config() -   loTargetFPFN=${loTargetFPFN}");
+
+    my ($loTargetDir) = ($loTargetFPFN =~ /^(.+?)\/[^\/]+$/);
+
+    print "convert: ${loInputFileFPFN} -> ${loTargetFPFN}\n";
 
     #-------------------------------------------------------------------------
     # Extract the templates so that we can convert them too.
@@ -103,33 +176,45 @@ sub convert_config
         {
             my $loFile = $1;
 
-            $glReferencedBblayersConf{".".$loFile} = 1;
+            debug("convert_config() -   found bblayer.conf: ${loFile}");
+            $glReferencedBblayersConf{realpath("${glRootDir}/${loFile}")} = 1;
         }
 
         if ($lpLine =~ /^\s*OECORELOCALCONF\s*=\s*(.+?)$/)
         {
             my $loFile = $1;
 
-            $glReferencedLocalConf{".".$loFile} = 1;
+            debug("convert_config() -   found local.conf: ${loFile}");
+            $glReferencedLocalConf{realpath("${glRootDir}/${loFile}")} = 1;
         }
     }
 
-    system("mkdir -p ${loTargetDir}");
+    if (!exists($glArgs{'dry-run'}))
+    {
+        system("mkdir -p ${loTargetDir}");
+    }
 
     my @loMotd;
     my @loLocalConf;
 
-    my $loTargets = "arago";
+    my $loDistro = "arago";
+    
+    if ($arMode ne "import")
+    {
+        $loDistro = $glArgs{distro};
+    }
 
     if ($loTargetFPFN =~ /poky/)
     {
-        $loTargets = "poky";
+        $loDistro = "poky";
     }
     elsif ($loTargetFPFN =~ /distroless/)
     {
-        $loTargets = "distroless";
+        $loDistro = "distroless";
     }
 
+    debug("convert_config() -   loDistro=${loDistro}");
+
     my $loDescription = "";
 
     if ($loConfigName =~ /^arago-(.+)-config/)
@@ -188,6 +273,8 @@ sub convert_config
         $loDescription = "TI Processor SDK Linux v$loVersion";
     }
 
+    debug("convert_config() -   loDescription=${loDescription}");
+
     my $loLayerConfTemplate = "";
     my $loLocalConfTemplate = "";
     my $loBitbakeInclusiveVars = "no";
@@ -236,16 +323,35 @@ sub convert_config
         }
         else
         {
-            print "convert_config() -   lpLine = $lpLine\n";
+            debug("convert_config() -   lpLine = $lpLine");
         }
     }
 
+    debug("convert_config() -   loTargetDir=${loTargetDir}");
 
     my $loRelSrcDir = $loTargetDir;
+    $loRelSrcDir =~ s{$glSrcDir/}//;
     $loRelSrcDir =~ s/[^\/\.]/\.\./g;
     $loRelSrcDir =~ s/\.+/\.\./g;
 
-    open(XML, ">$loTargetFPFN");
+    debug("convert_config() -   loRelSrcDir=${loRelSrcDir}");
+
+    if ((-f $loTargetFPFN) && !exists($glArgs{force}))
+    {
+        print "  xml config alrady exists, skipping...\n";
+        debug("convert_config() - stop - exists");
+        return;
+    }
+
+    if (exists($glArgs{'dry-run'}))
+    {
+        open(XML, ">&STDOUT");
+    }
+    else
+    {
+        open(XML, ">$loTargetFPFN");
+    }
+
     print XML "<?xml version='1.0'?>\n";
     print XML "<config>\n";
     print XML "    <description>${loDescription}</description>\n";
@@ -254,9 +360,9 @@ sub convert_config
     {
         print XML "    <xi:include href='${loRelSrcDir}/common/motd_cicd.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
     }
-    if (-f "common/targets_${loTargets}.xml")
+    if (-f "${glSrcDir}/common/targets_${loDistro}.xml")
     {
-        print XML "    <xi:include href='${loRelSrcDir}/common/targets_${loTargets}.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
+        print XML "    <xi:include href='${loRelSrcDir}/common/targets_${loDistro}.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
     }
     print XML "    <xi:include href='${loRelSrcDir}/templates/${loLayerConfTemplate}' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
     print XML "    <xi:include href='${loRelSrcDir}/templates/${loLocalConfTemplate}' xmlns:xi='http://www.w3.org/2001/XInclude'/>\n";
@@ -311,6 +417,8 @@ sub convert_config
     print XML "    </tools>\n";
     print XML "</config>\n";
     close(XML);
+
+    debug("convert_config() - stop");
 }
 
 sub extract_repo
@@ -340,24 +448,53 @@ sub extract_repo
 
 sub convert_local_conf_template
 {
+    debug("convert_local_conf_template() - start");
+
     my $arFile = shift;
 
+    debug("convert_local_conf_template() -   arFile=${arFile}");
+
     my $loTargetFPFN = $arFile;
-    $loTargetFPFN =~ s/^\.\.\/sample-files/templates/;
+    $loTargetFPFN =~ s{^${glRootDir}/sample-files}/${glRootDir}\/src\/templates/;
     $loTargetFPFN =~ s/\.sample$/.xml/;
-    my ($loTargetFN) = ($loTargetFPFN =~ /^templates\/(.+).xml$/);
+
+    debug("convert_local_conf_template() -   loTargetFPFN=${loTargetFPFN}");
+
+    my ($loTargetFN) = ($loTargetFPFN =~ /\/([^\/]+).xml$/);
+
+    debug("convert_local_conf_template() -   loTargetFN=${loTargetFN}");
 
     print "convert: ${arFile} -> ${loTargetFPFN}\n";
 
     my ($loTargetDir) = ($loTargetFPFN =~ /^(.+?)\/[^\/]+$/);
 
-    system("mkdir -p ${loTargetDir}");
+    debug("convert_local_conf_template() -   loTargetDir=${loTargetDir}");
+
+    if (!exists($glArgs{'dry-run'}))
+    {
+        system("mkdir -p ${loTargetDir}");
+    }
 
     open(CFG, $arFile);
     my @loLines = <CFG>;
     close(CFG);
 
-    open(XML, ">$loTargetFPFN");
+    if ((-f $loTargetFPFN) && !exists($glArgs{force}))
+    {
+        print "  local_conf template already exists, skipping...\n";
+        debug("convert_local_conf_template() - stop - exists");
+        return;
+    }
+
+    if (exists($glArgs{'dry-run'}))
+    {
+        open(XML, ">&STDOUT");
+    }
+    else
+    {
+        open(XML, ">$loTargetFPFN");
+    }
+
     print XML "<local-conf-template name='${loTargetFN}'>\n";
 
     foreach my $lpLine (@loLines)
@@ -376,28 +513,59 @@ sub convert_local_conf_template
 
     print XML "</local-conf-template>\n";
     close(XML);
+
+    debug("convert_local_conf_template() - stop");
 }
 
 sub convert_bblayers_conf_template
 {
+    debug("convert_bblayers_conf_template() - start");
+
     my $arFile = shift;
 
+    debug("convert_bblayers_conf_template() -   arFile=${arFile}");
+
     my $loTargetFPFN = $arFile;
-    $loTargetFPFN =~ s/^\.\.\/sample-files/templates/;
+    $loTargetFPFN =~ s{^${glRootDir}/sample-files}/${glRootDir}\/src\/templates/;
     $loTargetFPFN =~ s/\.sample$/.xml/;
-    my ($loTargetFN) = ($loTargetFPFN =~ /^templates\/(.+).xml$/);
+
+    debug("convert_bblayers_conf_template() -   loTargetFPFN=${loTargetFPFN}");
+
+    my ($loTargetFN) = ($loTargetFPFN =~ /\/([^\/]+).xml$/);
+
+    debug("convert_bblayers_conf_template() -   loTargetFN=${loTargetFN}");
 
     print "convert: ${arFile} -> ${loTargetFPFN}\n";
 
     my ($loTargetDir) = ($loTargetFPFN =~ /^(.+?)\/[^\/]+$/);
 
-    system("mkdir -p ${loTargetDir}");
+    debug("convert_bblayers_conf_template() -   loTargetDir=${loTargetDir}");
+
+    if (!exists($glArgs{'dry-run'}))
+    {
+        system("mkdir -p ${loTargetDir}");
+    }
 
     open(CFG, $arFile);
     my @loLines = <CFG>;
     close(CFG);
 
-    open(XML, ">$loTargetFPFN");
+    if ((-f $loTargetFPFN) && !exists($glArgs{force}))
+    {
+        print "  bblayers_conf template already exists, skipping...\n";
+        debug("convert_bblayers_conf_template() - stop - exists");
+        return;
+    }
+
+    if (exists($glArgs{'dry-run'}))
+    {
+        open(XML, ">&STDOUT");
+    }
+    else
+    {
+        open(XML, ">$loTargetFPFN");
+    }
+
     print XML "<bblayers-conf-template name='${loTargetFN}'>\n";
 
     foreach my $lpLine (@loLines)
@@ -408,5 +576,60 @@ sub convert_bblayers_conf_template
 
     print XML "</bblayers-conf-template>\n";
     close(XML);
+
+    debug("convert_bblayers_conf_template() - stop");
+
+}
+
+sub debug
+{
+    if (exists($glArgs{debug}))
+    {
+        print @_,"\n";
+    }
+}
+
+sub realpath
+{
+    my $rvRealPath = qx( realpath @_ );
+    chomp($rvRealPath);
+    return($rvRealPath);
+}
+
+sub usage
+{
+    print "$0\n";
+    print "    --input <file> [--config-name <name> ] [--distro <distro>]\n";
+    print "  or\n";
+    print "    --import-existing\n";
+    print "\n";
+    print "  --input <file>         The oe-layersetup config to convert.  This file\n";
+    print "                         does not need to be in the tree, but you probably\n";
+    print "                         need to specify --config-name to tell the convert\n";
+    print "                         script what the file name of the config will be.\n";
+    print "\n";
+    print "  --config-name <string> Relative dir name for the new config.  If the\n";
+    print "                         config needs to reside in a subdirectory, then that\n";
+    print "                         needs to be part of the name.  For example:\n";
+    print "                           --config-name \"coresdk/coresdk-10.00.07-config.txt\"\n";
+    print "\n";
+    print "  --distro <string>      If the distro is not clear from the name of the\n";
+    print "                         --input config, then you can specify the distro\n";
+    print "                         that the config is targetting.\n";
+    print "                           Default: \"arago\"\n";
+    print "\n";
+    print "  --import-existing      Convert all of the existing configs.  This was\n";
+    print "                         meant to be a one-time run option, but is being\n";
+    print "                         left in case it is needed in the future.\n";
+    print "\n";
+    print "  --force                If a config already exists with the name specified,\n";
+    print "                         then it will bail and not reconvert it.  Use\n";
+    print "                         --force to do the conversion anyway.\n";
+    print "\n";
+    print "  --dry-run              Do not modify anything, just print the conversion\n";
+    print "                         to STDOUT.\n";
+    print "\n";
+    print "  --debug                Show debugging messages.\n";
+    print "\n";
 }
 
-- 
2.17.1


