Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id CAB2B52A6D
	for <meta-arago@arago-project.org>;
	Wed, 14 Jan 2015 20:56:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0EKuPdr008835
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 14:56:25 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0EKuPK9001538
	for <meta-arago@arago-project.org>; Wed, 14 Jan 2015 14:56:25 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 14:56:24 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0EKuNtN014741;	Wed, 14 Jan 2015 14:56:24 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0EKuM5D014703;	Thu, 15 Jan 2015 02:26:22 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Jan 2015 14:56:17 -0600
Message-ID: <1421268980-25002-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 0/3] sitara-linux-ti-staging
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
X-List-Received-Date: Wed, 14 Jan 2015 20:56:26 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

These patches are dependent on the patch "sitara-linux-ti-staging: Create recipe
for Sitara 3.14 kernel tree" being comitted to meta-ti daisy/master.

Franklin S. Cooper Jr (3):
  arago-source-ipk: Add sitara-linux-ti-staging
  sitara-linux-ti-staging: Add append to insure kernel sources are
    packaged
  branding-amsdk: Set preferred provider to point to
    sitara-linux-ti-staging

 .../conf/distro/arago-source-ipk.conf              |    5 +++++
 .../conf/distro/include/branding-amsdk.inc         |    3 +++
 ...ppend => sitara-linux-ti-staging_3.14.bbappend} |    2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)
 copy meta-arago-distro/recipes-kernel/linux/{linux-ti-staging_3.12.bbappend => sitara-linux-ti-staging_3.14.bbappend} (90%)

-- 
1.7.9.5


