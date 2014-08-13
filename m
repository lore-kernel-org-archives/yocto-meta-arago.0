Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D08EC52981
	for <meta-arago@arago-project.org>;
	Wed, 13 Aug 2014 19:46:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7DJkPOP023561
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:25 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7DJkP6t002365
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 14:46:24 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7DJkN17015861;	Wed, 13 Aug 2014 14:46:24 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7DJkFTv012731;	Thu, 14 Aug 2014 01:16:22 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Aug 2014 14:46:12 -0500
Message-ID: <1407959172-16985-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407959172-16985-1-git-send-email-fcooper@ti.com>
References: <1407959172-16985-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 6/6] ts-calibrate-init: Simplify calibrate logic
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
X-List-Received-Date: Wed, 13 Aug 2014 19:46:26 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Setting some of the tslib specific environment variable has been added to
  tslib's /etc/profile.d script.
* Therefore, remove unneeded logic here.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/tslib/ts-calibrate-init/init  |   30 +++++++-------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
index db5c278..cd59b5b 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
@@ -10,32 +10,22 @@
 # of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 
-tsfile=/etc/pointercal
-export TSLIB_TSDEVICE=/dev/input/touchscreen0
-
 # First let's check if we even see a touchscreen device node.  If not
 # then bail out.
-if [ ! -e $TSLIB_TSDEVICE ]
+if [ ! -e /dev/input/touchscreen0 ]
 then
     exit
 fi
 
-# Check if the SD card is mounted and the first partition is
-# vfat.  If so let's write the pointercal file there so that if
-# someone messes up calibration they can just delete the file from
-# any system and reboot the board.
-
-#TODO how can we find the SD card and not eMMC?  can we look for a "boot"
-# LABEL?
-mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
-if [ "$?" = "0" ]
-then
-    tsfile=/run/media/mmcblk0p1/pointercal
-fi
+# Import Important System Environment Variables
+SCRIPTS=/etc/profile.d/*.sh
 
-export TSLIB_CALIBFILE=$tsfile
+for f in $SCRIPTS
+do
+    source $f
+done
 
-if [ ! -f $tsfile ] ; then
+if [ ! -f $TSLIB_CALIBFILE ] ; then
     echo -n "Calibrating touchscreen (first time only)"
     ts_calibrate
     echo "."
@@ -45,8 +35,8 @@ if [ ! -f $tsfile ] ; then
     # that running other applications that look for /etc/pointercal and
     # without TSLIB_CALIBFILE set will still get the right calibration.
     # TODO: can we just globally export TSLIB_CALIBFILE?
-    if [ ! -f /etc/pointercal -a -f $tsfile ]
+    if [ ! -f /etc/pointercal -a -f $TSLIB_CALIBFILE ]
     then
-        cp $tsfile /etc/pointercal
+        cp $TSLIB_CALIBFILE /etc/pointercal
     fi
 fi
-- 
1.7.9.5


