Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1705C529DB
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 06:50:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8A6n6rH100842
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 01:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568098146;
	bh=J4n07N3ugc3wYaUBP6fUvNyHHR3ILYWOlm3ZOdBk8Io=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a8TKjzbzlfzXseDlpZn97KoofXn1KpKvCKyEsITjN6kCj9wL7O1Qsp10u2tp0s/e6
	BQHf5Q07r7kaArSbOC1M6uYEd9DZAtAQj3IXnE8XAdcBXrGladvVexe1v2zoCOs0Z6
	gPMPK0l39dMU4oxW9bPbMIwFpdFIsXNtmm/e3EAw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8A6n6n4111311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 01:49:06 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 01:49:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 01:49:06 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8A6n2bw046308; 
	Tue, 10 Sep 2019 01:49:05 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Tue, 10 Sep 2019 12:18:59 +0530
Message-ID: <1568098140-193923-2-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568098140-193923-1-git-send-email-nikhil.nd@ti.com>
References: <1568098140-193923-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud PATCH v2 2/3] recipes-devtools: libion: New recipe for ion library
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
X-List-Received-Date: Tue, 10 Sep 2019 06:50:13 -0000
Content-Type: text/plain

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
Changes from v1:
* Retained original authorship

 meta-arago-extras/recipes-devtools/ion/libion_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ion/libion_git.bb

diff --git a/meta-arago-extras/recipes-devtools/ion/libion_git.bb b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
new file mode 100644
index 0000000..7c93ed3
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
@@ -0,0 +1,14 @@
+SUMMARY = "ION Userspace Memory Allocator Library"
+HOMEPAGE = "https://github.com/glneo/libion"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+PV = "1.0.0"
+
+BRANCH = "master"
+SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
+SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
-- 
1.9.1


