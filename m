Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by arago-project.org (Postfix) with ESMTPS id 5EA5652A85
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:45 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id k7so1411013oag.2
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=XHVB1U0ZuCxJcQ8ozMu92SGIKXsuV7V7QLW0AsY6gfU=;
	b=PwMzD4zeRXNozal+dTeOKtOR/IHOvWYxa4FdUJUpXyshie+FdJ8eXH7QM69RZCOwzE
	F/SbIV2e3nSRl4GgHO/BVOtXsa+e0Rsuv91VWPKfohyOJ2vOTaJ7pXjvOitCibihQ+xP
	b5OljEvcn7E10z8BYTPNlLbKG3aSba9hBFd4ICnOsRvkEWpFmX9QUH8baPt2yXB9dyJ4
	RLIfkBpEdJUNw1OQe7d97ZvR9P8b+GT1SLEqMUVGZc4cCJw9FCTtP6fgkg/I5Y/Sk6g0
	q41CmjeKd6IU0Y/WcbLPIgUIJxCAmVOKeDwAhsD74J+rq4KV942bgozeZkpPwfJyA0ib
	4AoA==
X-Received: by 10.182.151.9 with SMTP id um9mr11784787obb.89.1359393944870;
	Mon, 28 Jan 2013 09:25:44 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.43
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:43 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:04 -0600
Message-Id: <1359393932-31361-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/32] gnutls: Allow non GPLv3 version of gettext to work
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:45 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* This SDK allows select GPLv3 libraries but for now the GPLv2 version of
  gettext must be used.
* Since we don't set INCOMPATIBLE_LICENSE to GPLv3 in arago.conf, gnutls the
  base recipe adds a patch that forces the GPLv3 version of gettext to be used.
* Working around this issue by setting INCOMPATIBLE_LICENSE to GPLv3 locally.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-support/gnutls/gnutls_2.12.17.bbappend |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-support/gnutls/gnutls_2.12.17.bbappend

diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_2.12.17.bbappend b/meta-arago-distro/recipes-support/gnutls/gnutls_2.12.17.bbappend
new file mode 100644
index 0000000..fa73dd0
--- /dev/null
+++ b/meta-arago-distro/recipes-support/gnutls/gnutls_2.12.17.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+# Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
+# version of gettext.
+INCOMPATIBLE_LICENSE = "GPLv3"
-- 
1.7.0.4


