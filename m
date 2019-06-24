Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BC8E25299E
	for <meta-arago@arago-project.org>;
	Mon, 24 Jun 2019 12:53:38 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OCqt8h008330
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 07:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561380775;
	bh=NIGqjjQnhJzjMgoWi0dxavXacIpoQaKbY2tdztsmqm8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=IllXWfB7cHrBrt2ctGTHuPqtUeo9uv7mgX6/OHN4WHhDeMIkiu9AVQgnmM58LyGxM
	xKSwfrXgLGPgKtexUYd5C6YwuBh49ihGGWBeJXY4u0tOG+JuzQ5BfvMvzRKIUeqI/I
	MzICRM0733YDubct9ojovPn2UpUty3ZvaJH1v2PY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OCqt9P102614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 07:52:55 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 07:52:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 24 Jun 2019 07:52:52 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OCqqjR125755;
	Mon, 24 Jun 2019 07:52:52 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <20190620194255.4161-1-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c75aae12-17ad-c3c8-c96c-a67583cfbc22@ti.com>
Date: Mon, 24 Jun 2019 08:52:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190620194255.4161-1-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/ti2019.01][PATCH] arago.conf: add xkbcommon-evdev back to qtbase PACKAGECONFIG
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
X-List-Received-Date: Mon, 24 Jun 2019 12:53:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake

On 6/20/2019 3:42 PM, Eric Ruei wrote:
> xkbcommon-evdev is required for keyboard input
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 7fde15de..a7f55f0c 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -99,7 +99,7 @@ PACKAGECONFIG_append_pn-systemd = " coredump"
>   
>   # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
>   PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
> -PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples accessibility gif gbm kms libinput"
> +PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples accessibility gif gbm kms libinput xkbcommon-evdev"
>   PACKAGECONFIG_FONTS_pn-qtbase = "fontconfig"
>   
>   # Add gstreamer in package configuration to enable video

