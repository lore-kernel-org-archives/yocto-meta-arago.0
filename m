Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 070FF52A71
	for <meta-arago@arago-project.org>;
	Tue, 15 Jul 2014 11:28:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6FBSexK031560
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 06:28:40 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6FBSeUT030990
	for <meta-arago@arago-project.org>; Tue, 15 Jul 2014 06:28:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 15 Jul 2014 06:28:40 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6FBSdeV003537;	Tue, 15 Jul 2014 06:28:40 -0500
Received: from sdit-build04.dal.design.ti.com (sdit-build04.dal.design.ti.com
	[10.247.66.55])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s6FBSbVQ017717;	Tue, 15 Jul 2014 16:58:38 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Jul 2014 06:28:31 -0500
Message-ID: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] Allow shallow git clones
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
X-List-Received-Date: Tue, 15 Jul 2014 11:28:42 -0000
Content-Type: text/plain

All,

This patch set allows for creating shallow git clones which is useful
to reduct the size of the packages git repository.  In my testing using
the git-native version 1.9.0 found in oe-core this reduced the kernel
sources size from 1.5GB to 762MB.  This issue originally came up because
there is a 2GB file size limit for InstallBuilder and this large git
history was causing the SDK to be too big.  No wthe SDK size has
reduced to something more reasonable like 1.6GB total.

The full history can still be fetched using "git pull" or "git pull --unshallow"
depending on the git version being used.

Chase Maupin (4):
  sourceipk: allow packaging shallow git clone
  arago-source-ipk: do a shallow clone of the kernel
  arago: unset ASSUME_PROVIDED for git-native
  linux-ti-staging: update bbappend for 3.14 version

 meta-arago-distro/classes/sourceipk.bbclass        |  100 +++++++++++++++++---
 .../conf/distro/arago-source-ipk.conf              |    1 +
 meta-arago-distro/conf/distro/arago.conf           |    5 +
 ....12.bbappend => linux-ti-staging_3.14.bbappend} |    2 +
 4 files changed, 97 insertions(+), 11 deletions(-)
 copy meta-arago-distro/recipes-kernel/linux/{linux-ti-staging_3.12.bbappend => linux-ti-staging_3.14.bbappend} (94%)

-- 
1.7.9.5


