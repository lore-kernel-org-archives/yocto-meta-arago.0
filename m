Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E339C520E0
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 17:09:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AH9ER1068560
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 12:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560186554;
	bh=iSTDCcejGHlv5GxUIPnUnEb2ow43kVDdcCrGg2wl0aw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=L5uaAyGXHpBZk7jdBtwYXtLSM7gmS2dtCtcX/sdeP90hltU98UJwSY+MoohCPK5fk
	/Ypg8gpnZsGXmGQb65r7F9mEfYGlNC/cKSKeXrz4yC/230oe4j7XM1XIHKp4YnRyzn
	roLkZ5jqtDIjnCMxakBjM0OIgAbqCRtukbFUwpGw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AH9ELa009012
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 12:09:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 12:09:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 12:09:13 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AH9D9l063379;
	Mon, 10 Jun 2019 12:09:13 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <20190517004737.16209-1-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <23657d6c-d346-5108-d09f-79c18d41e289@ti.com>
Date: Mon, 10 Jun 2019 13:09:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517004737.16209-1-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Mon, 10 Jun 2019 17:09:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Even with this patch, I am still seeing the file-rdeps issue. Could this 
be caused by point-cloud-viewer being a pre-built binary?


point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package 
point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.21), but no 
providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package 
point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.20), but no 
providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package 
point-cloud-viewer requires libstdc++.so.6(CXXABI_1.3), but no providers 
found in RDEPENDS_point-cloud-viewer? [file-rdeps]
point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package 
point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.19), but no 
providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package 
point-cloud-viewer requires libstdc++.so.6(CXXABI_ARM_1.3.3), but no 
providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package 
point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.11), but no 
providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package 
point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4.9), but no 
providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
point-cloud-viewer-2.0: /usr/bin/point_cloud_viewer contained in package 
point-cloud-viewer requires libstdc++.so.6(GLIBCXX_3.4), but no 
providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]


On 5/16/2019 8:47 PM, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> index f47623a1..e477448b 100644
> --- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> +++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> @@ -17,7 +17,7 @@ PV = "2.0"
>   
>   S = "${WORKDIR}/git"
>   
> -RDEPENDS_${PN} = "glfw opencv"
> +RDEPENDS_${PN} = "glfw opencv libstdc++"
>   
>   do_install() {
>       install -d ${D}${bindir}

