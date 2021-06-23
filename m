Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 7144C52A4B
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 21:43:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15NLhMM6018525;
	Wed, 23 Jun 2021 16:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624484602;
	bh=jFBLAFT2z7QIqY320L6LDnmbdUUO+VEh6r85jNJmeIg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UQifmqAbW8pEnyoSsWeF8GhenqafW2uGqaxxix+O2G88JgQ3MbEg71Kkk1NKzHXQp
	MRAjb6e3+iSfZHwn0EDx3vwsIwX6UPZx+NCkoX61FjzjFVb3Gj2Q/cD5SnayRQO8Uk
	83Y/9+/mz0A96CwsBEmsTVaSZENq4vqkfJB59Zww=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15NLhMNH100458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Jun 2021 16:43:22 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 23 Jun 2021 16:43:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 23 Jun 2021 16:43:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15NLhMXP034263;
	Wed, 23 Jun 2021 16:43:22 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denis@denix.org>
Date: Wed, 23 Jun 2021 16:43:18 -0500
Message-ID: <20210623214320.9645-2-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210623214320.9645-1-nm@ti.com>
References: <20210623214320.9645-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: [oe-layersetup PATCH V2 1/3] sample-files: Add a URL redirection gitconfig sample file
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
X-List-Received-Date: Wed, 23 Jun 2021 21:43:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As we move git repositories over to newer locations, there is
a definite need to redirect older url usage to newer locations.

Lets start with a basic configuration for the core repositories.

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
* picked up Reviewed-by
* no change

V1: http://arago-project.org/pipermail/meta-arago/2021-June/013230.html
 sample-files/gitconfig.sample | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 sample-files/gitconfig.sample

diff --git a/sample-files/gitconfig.sample b/sample-files/gitconfig.sample
new file mode 100644
index 000000000000..2d06bdcd80b9
--- /dev/null
+++ b/sample-files/gitconfig.sample
@@ -0,0 +1,16 @@
+# Sample git config URL redirection
+# Copy this information to ~/.gitconfig or equivalent
+# See https://git-scm.com/docs/git-config for further information
+# To debug, use GIT_CURL_VERBOSE=1 GIT_TRACE=1
+
+[url "git://git.yoctoproject.org/meta-arago"]
+	insteadOf = git://arago-project.org/git/meta-arago
+	insteadOf = http://arago-project.org/git/meta-arago
+
+[url "git://git.yoctoproject.org/meta-ti"]
+	insteadOf = git://arago-project.org/git/meta-ti
+	insteadOf = http://arago-project.org/git/meta-ti
+
+[url "git://git.ti.com/arago-project/oe-layersetup"]
+	insteadOf = git://arago-project.org/git/projects/oe-layersetup
+	insteadOf = http://arago-project.org/git/projects/oe-layersetup
-- 
2.32.0


