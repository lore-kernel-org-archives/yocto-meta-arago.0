Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id 4403E52AD9
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:45 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n9so1045807oag.27
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=eYwXx2sN8d18f4AYvygKB2oL6o7dU+an01getUWOfas=;
	b=NzDM5pPv4wPiv+6yZyFschPYNTezEsieCwlJvMtAH9n9AruSUswnka9CYoKy8rH9Z8
	ZkREeacE9X6ggJZsprHem565+8G6yYbCDGvezOYN7FoxrHlnQtDXfaanmc+rkYbKZNYB
	cAkdSyDLRNWl+ZoW4Ig9MZYvCnLqdCqk7DhzDC/YlJ8G+1lxOPAsoT44Hdos4m0SBOq7
	mkpsJ8joGC8O2P+3d/PlVFcFWwnYCiC/FaKOANmxt6ftVMsZrN177MC3wPwo9A9CQcWN
	l6y8oisoXaHQloPu+ZB/L38qZP2AI1TwYXNwRVPhqnP9Q9yxo0pTeepBPvdySyzZIVpr
	X7JQ==
X-Received: by 10.182.117.5 with SMTP id ka5mr5674165obb.49.1359151124365;
	Fri, 25 Jan 2013 13:58:44 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.42
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:43 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:06 -0600
Message-Id: <1359150851-23602-25-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 26/31] sourceipk.bbclass: Remove .git directory
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:45 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Git repositories are corrupted due to the way bitbake clones and unpacks git
  repositories. This requires additional investigation to correct this issue.
* Removing .git repositories for now until a proper solution is discovered.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 09d6eb8..ecc92c2 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -56,6 +56,21 @@ SRCIPK_SECTION ?= "${SECTION}"
 # Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
 SRCIPK_INCLUDE_EXTRAFILES ?= "1"
 
+
+# Remove git repositories before packaging up the sources
+clear_git() {
+
+    cd ${S}
+
+    if [ -d ".git" ]
+    then
+        rm -rf .git
+    fi
+
+    cd -
+
+}
+
 # Create a README file that describes the contents of the source ipk
 sourceipk_create_readme() {
     readme="$1/README.${PN}-src"
@@ -79,6 +94,9 @@ sourceipk_create_readme() {
 sourceipk_do_create_srcipk() {
     if [ ${CREATE_SRCIPK} != "0" ]
     then
+
+        clear_git
+
         tmp_dir="${WORKDIR}/sourceipk-tmp"
         srcipk_dir="${WORKDIR}/sourceipk-data"
         mkdir -p $tmp_dir/CONTROL
-- 
1.7.0.4


