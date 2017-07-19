Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D98C952A6A
	for <meta-arago@arago-project.org>;
	Wed, 19 Jul 2017 17:51:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6JHpJ56015074
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 12:51:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500486679;
	bh=I7oaEBL6Fxt5oWeUhELFXJ1Vp9cdC02x3WFqt4b3goY=;
	h=From:To:CC:Subject:Date;
	b=JQll8kcJmF2ehaf+C1Kdk/+UkTNwdCMGyGp+PgOCdcypL06xy/MG52Es+gKdVBfoL
	LyoW2SdZakpPxPBrEVjKdVck6eqoVytOMR/CdxFWysK5G9d6KfHpKD2iP4p+aNj9nV
	Go3CjPUhIfiEwyYvnE/6hdlSeQ4O7pi0M3rIePCo=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6JHpER5028166
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 12:51:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Jul 2017 12:51:13 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6JHpDKC022505;	Wed, 19 Jul 2017 12:51:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jul 2017 13:51:12 -0400
Message-ID: <1500486672-24259-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH] arago-morty-next-rel: add config for "morty-next-rel" branch
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
X-List-Received-Date: Wed, 19 Jul 2017 17:51:29 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{arago-morty.txt => arago-morty-next-rel.txt}  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 copy configs/farm/{arago-morty.txt => arago-morty-next-rel.txt} (99%)

diff --git a/configs/farm/arago-morty.txt b/configs/farm/arago-morty-next-rel.txt
similarity index 99%
copy from configs/farm/arago-morty.txt
copy to configs/farm/arago-morty-next-rel.txt
index 3a76a02..b6a9c59 100644
--- a/configs/farm/arago-morty.txt
+++ b/configs/farm/arago-morty-next-rel.txt
@@ -59,7 +59,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-arago-morty"
+BUILD_ROOT="/OE/farm-arago-morty-next-rel"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
@@ -123,7 +123,7 @@ CLEAN_ALL="false"
 
 # This is the configuration file to use in the oe-layertool-setup.sh script
 # to configure the build.
-CONFIG_FILE="${BUILD_ROOT}/configs/arago-morty-config.txt"
+CONFIG_FILE="${BUILD_ROOT}/configs/arago-morty-next-rel-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
 # This includes:
-- 
1.7.9.5


