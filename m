Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D49EA529CB
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 18:15:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AIFoA7016879
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:15:50 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AIFmf1028956
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:15:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 13:15:48 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AIFlpk021054;
	Fri, 10 Apr 2015 13:15:48 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YgdT0-0005mM-9K;
	Fri, 10 Apr 2015 14:15:46 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Apr 2015 14:15:42 -0400
Message-ID: <1428689742-22184-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] tisdk-image: Fix issues with manifest generation.
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
X-List-Received-Date: Fri, 10 Apr 2015 18:15:51 -0000
Content-Type: text/plain

* Issue with parsing last entry in package index.
* Issue with substituting for '|' in license field of text manifest.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 8aebcac..2a4c31a 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -501,6 +501,8 @@ EOF
             IFS="
 "
 
+            begin=""
+            end=""
             for pkg in ${package_start}; do
                 end=`echo $pkg | cut -d: -f1`
 
@@ -515,6 +517,12 @@ EOF
                 pkg_name=`echo $pkg | cut -d: -f3`
                 begin=$end
             done
+            if [ ! -z $end ]; then
+                end=`wc -l $pkg_idx | awk '{ print $1 }'`
+                end=$[$end + 1]
+                tail -n $[$end - $begin] $pkg_idx > ${control_dir}/${pkg_name// /}.control
+            fi
+
             IFS=${IFS_OLD}
         done
     fi
@@ -604,7 +612,7 @@ echo "
 " >> ${SW_MANIFEST_FILE}
 
 cat >> ${SW_MANIFEST_TEXT} << EOF
-| ${package} | ${version} | ${license/\|/\&} | ${delivered_as} | ${modified} | ${location} | ${source}
+| ${package} | ${version} | ${license//\|/or} | ${delivered_as} | ${modified} | ${location} | ${source}
 EOF
     done
 
-- 
1.7.9.5


