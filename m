Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id F104A52AF8
	for <meta-arago@arago-project.org>;
	Fri,  9 Jul 2021 18:03:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 169I445T107459;
	Fri, 9 Jul 2021 13:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625853844;
	bh=MPxNKXFQCfPetOViyzg+g8SBHFIWFub6/RbqtzDZ474=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HgnIk3MhrZ4JYto3u1qxUVGqFpmH+ngk17l5DQynXBwNxj+ZtBwnMpL23yasuJEKP
	WgxWZ81YQN0qaqnFRPHGE+/a4kAUSyU7cVhFUncsCuiWv11AneH3jc4N5nSzEpB9TI
	YE0U1Kr8hU6N/u6rzVJGtbfuQFYlt29Lw9NhZ8Bo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 169I42cS086812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 9 Jul 2021 13:04:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 169I44ft009680;
	Fri, 9 Jul 2021 13:04:04 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>
Date: Fri, 9 Jul 2021 13:03:59 -0500
Message-ID: <20210709180401.2977-4-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709180401.2977-1-nm@ti.com>
References: <20210709180401.2977-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [tisdk-build-scripts PATCH 3/5] config-build-env: Refactor to cleanup messed up build folder
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
X-List-Received-Date: Fri, 09 Jul 2021 18:04:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In some weird, yet unknown cases, the build folder might be messed up.
Lets make sure we clean that up first prior to cloning or updating
the folder. This seems to happen when we force via jenkins to abort a
running job, leaving the system in a weird state on the remote build
machine. It is not clear what specifically is going on in the sequence,
but lets add some diagnostics on if any errant processes are sticking
around in the previous process (VM cleanup etc) that prevented a
proper system cleanup.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 lib/oesdk/config-build-env | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 058823562693..885fbcfb50d9 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -15,7 +15,7 @@ fi
 # conditions apply:
 #   1. The checkout creates the final directory of BUILD_ROOT
 #   2. If a git repo already exists then do a git pull
-#   3. If the directory is not empty and is not a git repo then bail
+#   3. If the directory is not empty and is not a git repo, then cleanup if unused
 checkout_layer_scripts() {
     cd `dirname $BUILD_ROOT`
 
@@ -28,18 +28,27 @@ checkout_layer_scripts() {
         exit 1
     fi
 
-    if [ ! -d $name ]
-    then
+    # If the scripts folder exists and is not a git repo, cleanup.
+    if [ -e $name -a ! -d $name/.git ]; then
+        echo "The $BUILD_ROOT directory is present and is not a git repo - attempting to wipe it off"
+        users=`lsof "$BUILD_ROOT"|wc -l`
+        if [ $users -gt 0 ]; then
+           echo "ERROR:: We have users for $BUILD_ROOT folder: Aborting!!!"
+           lsof $BUILD_ROOT
+           pstree -aplG
+           exit 1
+        fi
+        rm -rvf "$BUILD_ROOT" || exit 1
+    fi
+
+
+    if [ ! -d $name ]; then
         git clone "$TI_SDK_OELAYER_SETUP" $name
-    elif [ -d $name/.git ]
-    then
-        #This looks to be a git repo.  Hopefully it is the right one :)
+    else
+        # This looks to be a git repo.  Hopefully it is the right one :)
         cd $BUILD_ROOT
         git fetch
         git reset --hard origin
-    else
-        echo "The $BUILD_ROOT directory is not empty and is not a git repo"
-        exit 1
     fi
 }
 
-- 
2.32.0


