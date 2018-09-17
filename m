Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9DEEA529CA
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 13:50:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HDntCN029516
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537192195;
	bh=fZk5A4Jd8AT4Z2WkSa6P+RPWqU/MZGtyiKH1UC9HwFY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=PZWjtmZPVnUct5ygUNArh1d97Y97jHq7jwHBoDmMhVpPgX5CKtQLbvM4OwT/kuMyi
	Ab5ipI/x4G6/NlVdfmzsHHX4oCRWvdVuF/sT2jvrkIQtAczKSGzr8aJp66WGgqZUZn
	hO+2scB3oTrJG8ApL868/ZFd9PMT2+SssJBLBFpA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDntDe008027
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:49:55 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 08:49:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 08:49:55 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDnsl1000587;
	Mon, 17 Sep 2018 08:49:55 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20180912201611.120052-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bb404b5e-bbb7-3005-a0eb-1a77c8fa2287@ti.com>
Date: Mon, 17 Sep 2018 09:49:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180912201611.120052-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] tidl-api: update to version 01.01.00.01
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
X-List-Received-Date: Mon, 17 Sep 2018 13:50:04 -0000
Content-Type: multipart/alternative;
	boundary="------------B42064E582775CD5F51232C8"
Content-Language: en-US

--------------B42064E582775CD5F51232C8
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/12/2018 4:16 PM, Yuan Zhao wrote:
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index 97c2b68d..fb37a249 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,4 +1,4 @@
> -PV = "1.1.0.0"
> +PV = "1.1.0.1"
>   INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222"
> @@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
>   BRANCH = "master"
>   
>   SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "a229faf1c14ddfa48e44d271ddfad44e4e7fc033"
> +SRCREV = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"


--------------B42064E582775CD5F51232C8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content">Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake</pre>
    <br>
    <div class="moz-cite-prefix">On 9/12/2018 4:16 PM, Yuan Zhao wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180912201611.120052-1-yuanzhao@ti.com">
      <pre wrap="">Signed-off-by: Yuan Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yuanzhao@ti.com">&lt;yuanzhao@ti.com&gt;</a>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index 97c2b68d..fb37a249 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,4 +1,4 @@
-PV = "1.1.0.0"
+PV = "1.1.0.1"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222">"file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222"</a>
@@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "a229faf1c14ddfa48e44d271ddfad44e4e7fc033"
+SRCREV = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------B42064E582775CD5F51232C8--
