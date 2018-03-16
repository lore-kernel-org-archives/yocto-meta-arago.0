Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id EF01252994
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 18:29:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GISOlc023581
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 13:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521224904;
	bh=+HJm7JOd8ejUg9+4MyxupqPpKJmZTWH288hEgrfvF1g=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Obs/NUvDHkOJWbQfrswkLrG7ca4gcg+SLyaq7cEHzUrdf6F5B2Mlr3DqyGWTDJe1P
	nmGgOr7Cm0d7BxkaubqoPEfTl47RJxH2JAb4iZLuXJ6mStqP17MdkowInSkLVAtlxA
	qI78Yw1xASKALIcV1UP80Tugb2FuF08bDj2++i7Q=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GISN4h017423
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 13:28:23 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 13:28:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 13:28:23 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GISNaf029193;
	Fri, 16 Mar 2018 13:28:23 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1521223931-64051-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0ab98ef4-72c7-1437-32a0-4a7717ebe15c@ti.com>
Date: Fri, 16 Mar 2018 14:28:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521223931-64051-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][matrix-gui-v2-apps][PATCH] video_graphics_demo: add as a new test app
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
X-List-Received-Date: Fri, 16 Mar 2018 18:29:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Thank you.


On 3/16/2018 2:12 PM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   multimedia_apps/video_graphics/desc_video_graphics_demo.html | 12 ++++++++++++
>   multimedia_apps/video_graphics/video_graphics_demo.desktop   | 11 +++++++++++
>   2 files changed, 23 insertions(+)
>   create mode 100755 multimedia_apps/video_graphics/desc_video_graphics_demo.html
>   create mode 100644 multimedia_apps/video_graphics/video_graphics_demo.desktop
>
> diff --git a/multimedia_apps/video_graphics/desc_video_graphics_demo.html b/multimedia_apps/video_graphics/desc_video_graphics_demo.html
> new file mode 100755
> index 0000000..6a4ac55
> --- /dev/null
> +++ b/multimedia_apps/video_graphics/desc_video_graphics_demo.html
> @@ -0,0 +1,12 @@
> +<h1> Video Graphics Demo with GC320  and VIP on two screens</h1>
> +
> +<p>This application demonstrates the advance processing capabilities of DSS IP with the enhanced eglfs_kms QPA which provides new APIs for application to fully control the DRM overlay planes for image overlay and alpha blending while the the primary plane(CRTC) is still  controllede by QT components for the graphics content drawn by QT.
> +</p>
> +
> +<h2> Data flow </h2>
> +<p>
> +VIP capture <br>
> +&nbsp;&nbsp;&nbsp; ==>GC320 rotate 90 degree ==> QT QPA (draws the graphics content from qml file, scale, alpha blend and overlay the video with SGX output) <br>
> +&nbsp;&nbsp;&nbsp; ==>QT QPA (draws the graphics content from qml file, scale, alpha blend and overlay the video with SGX output) <br>
> +</p>
> +
> diff --git a/multimedia_apps/video_graphics/video_graphics_demo.desktop b/multimedia_apps/video_graphics/video_graphics_demo.desktop
> new file mode 100644
> index 0000000..1f1ca69
> --- /dev/null
> +++ b/multimedia_apps/video_graphics/video_graphics_demo.desktop
> @@ -0,0 +1,11 @@
> +#!/usr/bin/env xdg-open
> +[Desktop Entry]
> +Name=Video Graphics Demo
> +Icon=/usr/share/matrix-gui-2.0/apps/images/qt-icon.png
> +Exec= video-graphics-test -platform eglfs
> +Type=Application
> +Categories=multimedia
> +WinType=null
> +ProgramType=gui
> +X-MATRIX-Lock=qt
> +X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/video_graphics/desc_video_graphics_demo.html


