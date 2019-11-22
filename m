Return-Path: <xuj@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B3BA9529C2
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2019 13:43:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAMDfuxG096617
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2019 07:41:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574430116;
	bh=pAwEIXN3CUJYyP8xQGx2whjE3EcLefQLnTLHDr/1yqc=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=tPkspV7frcyk6qyG48+YzQDt2bOzm8MXpjMNRD1yj00bWmfg9jLqylRGYDNOROtay
	KoiKJqYDRAeVe/ZUitIHLLk85I0p+XYml79SCxMbhvSKGOFLwfz5nyZn8+M+NxlRAN
	CKHgnUjRdsJS9B0r4nqM0oRd6AFHs1rHDGS7BZu4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAMDfuLF081327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 22 Nov 2019 07:41:56 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 22 Nov 2019 07:41:56 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
	15.01.1847.003; Fri, 22 Nov 2019 07:41:56 -0600
From: "Xu, Jianzhong" <xuj@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][PATCH] neo-ai-dlr: fix dlr runtime problem
Thread-Index: AQHVn8NdnBiL4U9UU0SR8GWtJ7DHoqeXNWdA
Date: Fri, 22 Nov 2019 13:41:56 +0000
Message-ID: <f83b0084d3104f92b090856e91b702e1@ti.com>
References: <20191120165422.9897-1-xuj@ti.com>
In-Reply-To: <20191120165422.9897-1-xuj@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.55]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [meta-processor-sdk][PATCH] neo-ai-dlr: fix dlr runtime problem
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
X-List-Received-Date: Fri, 22 Nov 2019 13:43:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Any issue with this patch?

Thanks,
Jianzhong

-----Original Message-----
From: Xu, Jianzhong=20
Sent: Wednesday, November 20, 2019 11:54 AM
To: meta-arago@arago-project.org
Cc: Xu, Jianzhong
Subject: [meta-processor-sdk][PATCH] neo-ai-dlr: fix dlr runtime problem

* move dlr shared library to python sitepackages dlr folder

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-support/neo-ai/neo-ai-dlr_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-support/neo-ai/neo-ai-dlr_git.bb b/recipes-support/neo=
-ai/neo-ai-dlr_git.bb
index cbf4447..e81a939 100644
--- a/recipes-support/neo-ai/neo-ai-dlr_git.bb
+++ b/recipes-support/neo-ai/neo-ai-dlr_git.bb
@@ -57,6 +57,7 @@ do_install() {
=20
     # setup.py install some libs under datadir, but we don't need them, so=
 remove.
     rm ${D}${datadir}/dlr/*.so
+    mv ${D}${libdir}/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr
=20
     # Now install python test scripts
     install -d ${D}${datadir}/dlr/tests
--=20
2.17.1


