Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7951752993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 13:15:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DDFiQv057752
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 08:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536844544;
	bh=TU6zTvjXpI9FIlLMQ9z4w6yeFRWIP2u754kqVSoJ4Oo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=LZXxejrSWCcq/FcDBvqWyp0waya4MPJfyBESI34st+0Cp384tJxlOGBoeDv50x4Vp
	OlMm/TvF/uCN1wPrvDPISkO8fAWi8YP3awxvIviBL1/6DrzP9a457E+ysmTxTumelc
	upeGXIidPwriGasKIsyaN8a9J0NS/BxaEYAG+n0o=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DDFiGX027067
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 08:15:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 08:15:44 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 08:15:44 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DDFhiL003231;
	Thu, 13 Sep 2018 08:15:43 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1536843642-41755-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e712fe2a-a105-c1d3-529e-686d83d7d99c@ti.com>
Date: Thu, 13 Sep 2018 09:15:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536843642-41755-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [matrix-gui-v2-apps][PATCH] add qt5 webkit-based browser app
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
X-List-Received-Date: Thu, 13 Sep 2018 13:15:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This has been pushed. Thank you.


On 9/13/2018 9:00 AM, Eric Ruei wrote:
> The default browser app is webengine-based. This patch adds a webkit-based
> browser which may be required for some SoCs.
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop
>
> diff --git a/qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop b/qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop
> new file mode 100644
> index 0000000..f259c01
> --- /dev/null
> +++ b/qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop
> @@ -0,0 +1,12 @@
> +#!/usr/bin/env xdg-open
> +
> +[Desktop Entry]
> +Name=Browser
> +GenericName=Demo App
> +Icon=/usr/share/matrix-gui-2.0/apps/images/web-icon.png
> +Exec=/usr/share/qt5/examples/webkitwidgets/browser/browser http://www.ti.com
> +Type=Application
> +ProgramType=gui
> +Categories=Qt5
> +X-MATRIX-Lock=qt
> +Name[en_US]=qt5_webkit_browser.desktop


