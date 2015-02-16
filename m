Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5DEB252ABC
	for <meta-arago@arago-project.org>;
	Mon, 16 Feb 2015 21:30:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1GLUZN0004513
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:35 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1GLUYTr027988
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Feb 2015 15:30:33 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1GLUW6L005929;	Mon, 16 Feb 2015 15:30:33 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t1GLUOpq030075;	Tue, 17 Feb 2015 03:00:31 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Feb 2015 15:30:20 -0600
Message-ID: <1424122222-26709-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424122222-26709-1-git-send-email-fcooper@ti.com>
References: <1424122222-26709-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 6/8] branding-amsdk: Update wording for sourecipk commit message
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
X-List-Received-Date: Mon, 16 Feb 2015 21:30:36 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/branding-amsdk.inc         |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
index 27d651d..08990b8 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -11,17 +11,19 @@ PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
 SRCIPK_GIT_COMMIT_MESSAGE = "\
 Create local branch\\n\
 \\n\
-The below commit is used for this local branch and is the one used by this sdk:\\n\
+The below commit is used for this local branch and is the one used by\\n\
+this sdk:\\n\
 ${SRCREV}."
 
 SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE ="${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
-To save on installer space only a portion of the commit history has been\\n\
-preserved. Also links to remote branches and tags do not exist in this\\n\
-copy of the repository. To fix this please run:\\n\
-git fetch\\n\
+To reduce the size of the SDK installer only a portion of the git commit\\n\
+history has been preserved. Also links to remote branches and tags do\\n\
+not exist in this copy of the repository.\\n\
+To fix this please run the unshallow-repositories.sh\\n\
+script located in the sdk\'s bin directory\\n\
 \\n\
-This may take a couple of minutes but you will then have a full copy of\\n\
-the git repository.\\n"
+The script may take several minutes but you will then have a full copy of\\n\
+the git repository including its entire git history.\\n"
 
 SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging = "amsdk-8.0"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
-- 
1.7.9.5


