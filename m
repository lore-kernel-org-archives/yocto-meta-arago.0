Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B61F8520C0
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2019 17:58:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EHwAPS045944
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 12:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560535090;
	bh=1oMIG5kMiW9jQAFp2G9gbc6trAho8KCwyGy7CLYM89Y=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=LWZZlXv881MD+1bgBFSuspEXweIQHguJWI65r/yYoA0W9s+DmCXhNdJjyWpIf4h8V
	1+rynViWO4BF6fPpULUFNG4fI59RI9P3e5KiJiqcXWnpXp4FPxQfUIWpT1yxo+gPAa
	TTJncY6mr1+ghCw5APZ3qkT6wy41l6AkKsY74ZlQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EHwA2J111846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 12:58:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 14 Jun 2019 12:58:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 14 Jun 2019 12:58:10 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EHwAgH022050;
	Fri, 14 Jun 2019 12:58:10 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1560360603-34381-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <713d4409-7cf5-5f69-ae6b-bfd4f6cd86ca@ti.com>
Date: Fri, 14 Jun 2019 13:58:10 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560360603-34381-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] point-cloud-viewer: add RDEPENDS on libxkbcommon
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
X-List-Received-Date: Fri, 14 Jun 2019 17:58:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you backport this to ti2019.01?


Thank you,

Jake


On 6/12/2019 1:30 PM, Denys Dmytriyenko wrote:
> Fixes following QA error:
> ERROR: point-cloud-viewer-2.1-r1 do_package_qa: QA Issue: /usr/bin/point_cloud_viewer contained in package point-cloud-viewer requires libxkbcommon.so.0, but no providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb           | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> index 9ee4ff0..067ead9 100644
> --- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> +++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> @@ -17,7 +17,7 @@ PV = "2.1"
>   
>   S = "${WORKDIR}/git"
>   
> -RDEPENDS_${PN} = "glfw opencv libstdc++"
> +RDEPENDS_${PN} = "glfw opencv libxkbcommon"
>   
>   do_install() {
>       install -d ${D}${bindir}

