Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 4C98D5299C
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 15:49:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NFnKwu118443;
	Tue, 23 Mar 2021 10:49:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616514560;
	bh=QuJeABSjqmfudr3V278XeU0KGLIbRtT7OC4X41PS/XE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WScRhUpRTLtxa8t/XqUTXREz3yYjykva4KhgxnhiG+7zFGJCfWAkkyOFkblsRjuQn
	9Pc/LbVUhaiDFbwfB+pmNewDCROsu3ZBen0LHM5CgfMnkPE3atpmNZWenCmLJ4g8c9
	sWpspZf0hsfyTBghNHfK7KBk866DRgbnlz3dY7wQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NFnKNg026259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Mar 2021 10:49:20 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 23 Mar 2021 10:49:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 23 Mar 2021 10:49:19 -0500
Received: from [10.250.78.56] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NFnJjG049398;
	Tue, 23 Mar 2021 10:49:19 -0500
To: Nishanth Menon <nm@ti.com>, <denis@denix.org>
References: <20210323145133.9940-1-nm@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <0f0a3b6b-9be0-f5e0-00f9-a2d13c3fc59f@ti.com>
Date: Tue, 23 Mar 2021 10:49:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323145133.9940-1-nm@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH] layer.conf: Add hardknott to compatible release branches
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
X-List-Received-Date: Tue, 23 Mar 2021 15:49:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/23/2021 9:51 AM, Nishanth Menon wrote:
> This follows commit cfe3f78 ("layer.conf: add hardknott to compatible
> release branches") from meta-ti.
> 
> While we are at it, remove old releases before dunfell as we no longer
> support the build of such configurations.

Thanks for the fix. looks good to me.

I will make a similar cleanup fix for dunfell branch from meta-ti

--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf

-LAYERSERIES_COMPAT_meta-arago-distro = "sumo thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-arago-distro = "dunfell"

--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf


-LAYERSERIES_COMPAT_meta-arago-extras = "sumo thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-arago-extras = "dunfell"

> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> WARNING: there is a bunch of work to do to move to gatesgarth /
> hardknott .. https://pastebin.ubuntu.com/p/kKCqXvnDKf/
> 
> but this allows us to get started, I think.
> 
>   meta-arago-distro/conf/layer.conf | 2 +-
>   meta-arago-extras/conf/layer.conf | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 2931bf9daf4a..1fa61207fe01 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
>   BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-arago-distro = "10"
>   
> -LAYERSERIES_COMPAT_meta-arago-distro = "sumo thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arago-distro = "dunfell gatesgarth hardknott"
>   
>   LAYERDEPENDS_meta-arago-distro = " \
>       core \
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index 7e3081b20ba8..d64a80f8890f 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
>   BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-arago-extras = "10"
>   
> -LAYERSERIES_COMPAT_meta-arago-extras = "sumo thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arago-extras = "dunfell gatesgarth hardknott"
>   
>   # Set a variable to get to the top of the metadata location
>   ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
> 

