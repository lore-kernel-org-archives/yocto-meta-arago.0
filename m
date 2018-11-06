Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (unknown [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C0E5652092
	for <meta-arago@arago-project.org>;
	Tue,  6 Nov 2018 03:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1FDDD20B1B;
	Tue,  6 Nov 2018 03:50:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id D7oiG0_RZ6Fv; Tue,  6 Nov 2018 03:50:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ED43920B1A;
	Tue,  6 Nov 2018 03:50:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4F452164A39;
	Mon,  5 Nov 2018 22:50:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  5 Nov 2018 22:50:13 -0500
Message-Id: <1541476213-4845-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layerstup][PATCH] oe-layertool-setup.sh, *master-config.txt: add support for cloning repos w/o layers
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Nov 2018 03:50:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Historically, specifying empty layers= or not specifying it at all would result
in automatically locating all layers inside the repo and populating them into
bblayers.conf. Originally bitbake repo had no layers, but the script would
still add it to the bblayers.conf. Lately, some testing code has been added
to bitbake repo with few test layers inside, which would result in erroneously
locating and adding them to the final bblayers.conf. Add support for skipping
adding any layers completely by dropping layers= specifier. But leaving empty
layers= would result in the old behavior of locating all layers.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/distroless-master-config.txt |  2 +-
 configs/poky-master-config.txt       |  2 +-
 oe-layertool-setup.sh                | 22 ++++++++++++++++++----
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
index 27b3e11..19b5e63 100644
--- a/configs/distroless-master-config.txt
+++ b/configs/distroless-master-config.txt
@@ -1,6 +1,6 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
+bitbake,git://git.openembedded.org/bitbake,master,HEAD
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index f991e34..5a77ace 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -1,6 +1,6 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
+bitbake,git://git.openembedded.org/bitbake,master,HEAD
 poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index e1560f3..b309b55 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -177,12 +177,13 @@ parse_repo_line() {
     eval $prefix"commit"=`echo $1 | cut -d, -f4`
     parsed_layers=`echo $1 | cut -d, -f5-`
 
-    # Blank the temp variable
-    temp_layers=""
+    # If no layers= was used, then don't add any layers
+    temp_layers="none"
 
-    # If layers= was used then set the layers variable
+    # If layers= was used then set the layers variable, empty list would add all found layers
     if [ "x$parsed_layers" != "x" ]
     then
+        temp_layers=""
         temp=`echo $parsed_layers | cut -d= -f2`
         # temporarily reset the IFS value to : to split the layers
         for x in `IFS=":";echo $temp`
@@ -199,7 +200,10 @@ parse_repo_line() {
     if [ "x$temp_layers" = "x" ]
     then
         eval $prefix"repo_layers"="all"
-    else 
+    elif [ "x$temp_layers" = "xnone" ]
+    then
+        eval $prefix"repo_layers"="none"
+    else
         eval $prefix"repo_layers"='$temp_layers'
     fi
 }
@@ -315,6 +319,10 @@ configure_repo() {
     elif [ "x$repo_layers" = "x" ]
     then
         select_layers
+    elif [ "x$repo_layers" = "xnone" ]
+    then
+        # Call select layers with the none option to not select any layers
+        select_layers "none"
     fi
 
     verify_layers
@@ -482,6 +490,12 @@ select_layers() {
     #If so prompt for which layers to configure
     #If there is only one then just configure that layer and don't prompt
 
+    if [ "x$arg1" = "xnone" ]
+    then
+        repo_layers=""
+        return
+    fi
+
     cd $sourcedir
     # Get a count of how many layers there are
     count=`find $name -name "layer.conf" | grep -c layer.conf`
-- 
2.7.4


