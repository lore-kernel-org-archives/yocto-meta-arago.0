Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by arago-project.org (Postfix) with ESMTPS id 08E4552A29
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:45 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id oi10so2826613obb.26
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PPqM89FeaPa3tUu4GUuXTmgf0vfynFIvTCQrbddSz0s=;
	b=sDq6qkQfUIqkK9/dk48/WDNAwYbmF2/+9VZyP41HEdn6qnIrE4FMpoxCYpFckzQZ1y
	9D00J5Q2HBymkhT/r27649zcFLhTz74vI0wmUvaON2DT8iOrzRZdTisso7Fs2TvmpogZ
	DTwASAtNMYQPE5OFEQ/nks0PgOo7g44QeFEjlRUwDusEk5pCPjYWNostGfzBB0RS4yKd
	X139eSfKQqZXCbg26CaD2UkqkvkCBC///rHBKYf3WYSxy+uiLl8JpgL6U7cAyAjnJLNl
	oEgcSyX8t8TpD0WWxXjqCSDmOo/gaUvuIz9puOmWCrXKMMMT3inOzsm1FbdJh4v1ajRH
	w6Hg==
X-Received: by 10.60.1.168 with SMTP id 8mr4606572oen.46.1358445225468;
	Thu, 17 Jan 2013 09:53:45 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.43
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:44 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:12 -0600
Message-Id: <1358445195-22441-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/12] task-arago-tisdk-matrix: Add quick-playground Matrix application
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:46 -0000

* Add quick-playground to the list of Qt applications.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-matrix.bb  |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
index 4b9951e..529dd55 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r4"
+PR = "r5"
 
 inherit task
 
@@ -29,6 +29,7 @@ MATRIX_COMMON_APPS = "              \
 MATRIX_QT_APPS = "                  \
     matrix-gui-qt4-demos            \
     matrix-gui-thermostat-demo      \
+    ${@base_conditional('ARAGO_QT_PROVIDER','qt4-embedded-gles','matrix-gui-apps-quick-playground','', d)} \
 "
 
 MATRIX_QT_APPS_keystone = ""
-- 
1.7.0.4


