Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2C395529C6
	for <meta-arago@arago-project.org>;
	Fri,  9 Dec 2016 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25D4E20B22;
	Fri,  9 Dec 2016 17:06:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9jnhPde3xvWl; Fri,  9 Dec 2016 17:06:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB247207AF;
	Fri,  9 Dec 2016 17:06:07 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 2E2A91621CC;
	Fri,  9 Dec 2016 12:06:07 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  9 Dec 2016 12:06:04 -0500
Message-Id: <1481303165-23702-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481303165-23702-1-git-send-email-denis@denix.org>
References: <1481303165-23702-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] optee-client: use own git repo
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
X-List-Received-Date: Fri, 09 Dec 2016 17:06:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-client.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-client.bbappend

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
new file mode 100644
index 0000000..cdbfaab
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -0,0 +1,7 @@
+PR_append = ".arago0"
+
+SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
+           file://tee-supplicant.service"
+
+BRANCH = "ti_optee_client"
+SRCREV = "ce5fefe6cba5df9b4f31399b1155ba768eee0b78"
-- 
2.7.4


