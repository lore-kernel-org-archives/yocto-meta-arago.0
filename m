Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B057E529A0
	for <meta-arago@arago-project.org>;
	Thu, 24 Sep 2020 19:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E390140C23;
	Thu, 24 Sep 2020 19:27:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9yVLVLjP2pxG; Thu, 24 Sep 2020 19:27:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 60CFD40A2A;
	Thu, 24 Sep 2020 19:27:34 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BAFEA1741D0;
	Thu, 24 Sep 2020 15:27:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 24 Sep 2020 15:27:33 -0400
Message-Id: <1600975653-43463-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] oe-layertool-setup: support reset head to avoid conflicts due to rebase
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
X-List-Received-Date: Thu, 24 Sep 2020 19:30:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 oe-layertool-setup.sh | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index d14ed4f..aa16042 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -41,6 +41,7 @@ OECORELOCALCONFPATH="" # stores the path of the OECORELOCALCONFPATH variable
 outputfile="" # file to save output to if -o is used
 inputfile="" # file containing initial layers if -f is used
 interactive="n" # flag for interactive mode.  Default is n
+resethead="n" # flag for reset head mode.  Default is n
 layers="" # variable holding the layers to add to bblayers.conf
 output="" # variable holding the output to write to outputfile
 scriptdir=`pwd` # directory of this calling script
@@ -68,7 +69,7 @@ cat <<EOM
 
 
 Usage:
-    $0 [-i] [-f inputfile] [-o outputfile] [-d dldir] [-b basedir] [-h]
+    $0 [-i] [-f inputfile] [-o outputfile] [-d dldir] [-b basedir] [-h] [-r]
 
 Parameters:
     -i: Interactive mode.  This mode will query the user to input information
@@ -86,6 +87,7 @@ Parameters:
         where the build will be configured.  The default is the current
         directory.
     -h: This message
+    -r: Reset all previous checkouts or local changes to pull remote branches
 
 Input Files:
     Input files are expected to have the following format
@@ -407,11 +409,17 @@ checkout_branch() {
         git checkout $branch
     fi
 
-    # Now that we are on the proper branch merge the remote branch changes if
+    # Now that we are on the proper branch pull the remote branch changes if
     # any.  In the case of a clean checkout this should be already up to date,
     # but for an existing checkout this should be the changes that were
     # fetched earlier.
-    git merge origin/$branch
+    if [ "x$resethead" = "xy" ]
+    then
+        # Instead of merging, reset to remote branch to avoid conflicts due to rebase
+        git reset --hard origin/$branch
+    else
+        git merge origin/$branch
+    fi
 }
 
 checkout_commit() {
@@ -844,10 +852,11 @@ build_repo_line() {
 ###############
 
 # Parse the input options
-while getopts :if:o:d:b:h arg
+while getopts :irf:o:d:b:h arg
 do
     case $arg in
         i ) interactive="y";;
+        r ) resethead="y";;
         f ) inputfile="$OPTARG";;
         o ) outputfile="$OPTARG";;
         d ) dldir="$OPTARG";;
-- 
2.7.4


