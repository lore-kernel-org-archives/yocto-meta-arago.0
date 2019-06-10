Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 87C66520E0
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 17:11:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHAnKn121236
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 12:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560186649;
	bh=WOKXpL9B3s3Cm/9v4XD6v0Uw+H0EGay9HayzgBjboQs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YC9EslXAxLgbakXPPGl49oCGiY1ti61ms1+aQ3eUaxK5ithQz2ym7HzkW4esROCfV
	VV/SMfgfxYy0K4MSRr2BLOE+Gu/bK14zlVdRZ96DShJrp1mq5tk0iyHuYKNu+/VnlB
	BwztHzs+bqorBF24xy1iV+q2rWD09joH4x5Yh+I4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHAntf079031
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 12:10:49 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 12:10:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 12:10:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHAnPa037454;
	Mon, 10 Jun 2019 12:10:49 -0500
Date: Mon, 10 Jun 2019 13:10:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190610171048.GC25589@beryl>
References: <20190517004737.16209-1-denys@ti.com>
	<23657d6c-d346-5108-d09f-79c18d41e289@ti.com>
MIME-Version: 1.0
In-Reply-To: <23657d6c-d346-5108-d09f-79c18d41e289@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [PATCH 1/2] point-cloud-viewer: fix QA error regarding rdeps on libstdc++
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
X-List-Received-Date: Mon, 10 Jun 2019 17:11:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yes, it didn't work for me either. I was going to disable file-rdeps QA check.


On Mon, Jun 10, 2019 at 01:09:13PM -0400, Jacob Stiffler wrote:
> Even with this patch, I am still seeing the file-rdeps issue. Could this be
> caused by point-cloud-viewer being a pre-built binary?
> 
> 
> point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package
> point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.21), but no providers
> found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package
> point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.20), but no providers
> found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package
> point-cloud-viewer requires libstdc++.so.6(CXXABI_1.3), but no providers
> found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package
> point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.19), but no providers
> found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package
> point-cloud-viewer requires libstdc++.so.6(CXXABI_ARM_1.3.3), but no
> providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package
> point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.11), but no providers
> found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package
> point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.9), but no providers
> found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package
> point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4), but no providers
> found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> 
> 
> On 5/16/2019 8:47 PM, Denys Dmytriyenko wrote:
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb   | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> >index f47623a1..e477448b 100644
> >--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> >+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> >@@ -17,7 +17,7 @@ PV = "2.0"
> >  S = "${WORKDIR}/git"
> >-RDEPENDS_${PN} = "glfw opencv"
> >+RDEPENDS_${PN} = "glfw opencv libstdc++"
> >  do_install() {
> >      install -d ${D}${bindir}

