Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D30ED52A5F
	for <meta-arago@arago-project.org>;
	Tue, 28 Feb 2012 21:48:51 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1SLmn2B008575
	for <meta-arago@arago-project.org>; Tue, 28 Feb 2012 15:48:50 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SLmm9e027707
	for <meta-arago@arago-project.org>;
	Wed, 29 Feb 2012 03:18:49 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Feb 2012 03:18:48 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SLmjQ6017498;
	Wed, 29 Feb 2012 03:18:47 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Feb 2012 15:48:40 -0600
Message-ID: <1330465723-24817-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/3] update matrix sources
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
X-List-Received-Date: Tue, 28 Feb 2012 21:48:52 -0000
Content-Type: text/plain

The following patches update the matrix sources.

Patches 2 and 3 depend on the nbench-byte recipe being added
into meta-oe first.  The patch has been submitted to the list
but has not yet been committed.

Chase Maupin (3):
  refresh-screen: update to latest sources
  matrix-gui-apps-git: update to latest sources
  matrix-gui-armbenchmarks-demos: update dependencies

 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |    4 ++--
 .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)


