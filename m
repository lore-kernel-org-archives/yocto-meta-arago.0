Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2A8F65298A
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2018 18:28:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBAIS3Tj013379
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 12:28:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544466483;
	bh=bu7TYx8o9xPKzrS3Tq5i4CTH52EN2qpQtsNj0veHV+k=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=dU6H3UZfzUEK488FTXYnJENdoJenaUpGeZV14eDgo1yvS6uf1aw3A6/MsWafgy2wq
	TYbPrPuNJfHNLzggg75u3EtKPDiJ/JjOMlNlUQjDDivNn7es8+64ILilSx9VXj6KsD
	lcYTcG5xzVXJ24C/PPMLcKnofJucgELxYCRql8yw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBAIS3W5050660
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 12:28:03 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 10 Dec 2018 12:28:02 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 10 Dec 2018 12:28:02 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBAIS2V0025449;
	Mon, 10 Dec 2018 12:28:02 -0600
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1544457104-42812-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8c271475-2091-0cea-b1c5-742fe894950a@ti.com>
Date: Mon, 10 Dec 2018 13:28:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1544457104-42812-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] amsdk-av-files: move the AMSDK AV files from gforge.ti.com to git.ti.com
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
X-List-Received-Date: Mon, 10 Dec 2018 18:28:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK


For the license checksum change, entries for the new clips were added to 
the manifest.


- Jake


On 12/10/2018 10:51 AM, Eric Ruei wrote:
> - move the AMSDK AV files location
> - add k3 specific video images
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../amsdk-av-files/amsdk-av-files_1.4.bb                 | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> index 9d20b1a..2f570d4 100644
> --- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> +++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> @@ -1,9 +1,9 @@
>   DESCRIPTION = "AMSDK multimedia support files"
> -HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
> +HOMEPAGE = "https://git.ti.com/processor-sdk/amsdk-av-files/"
>   LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
>   SECTION = "multimedia"
> -LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=da0727f80b90422138535dfffc36cd1a"
> -PR = "r1"
> +LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=fe154d291c69c51495a5bb4a456403b5"
> +PR = "r2"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -19,12 +19,16 @@ VIDEO_FILES_append_dra7xx      = "video_wvga \
>                                     video_1080p \
>                                     video_720p \
>                                     video_yuv"
> +VIDEO_FILES_append_k3          = "video_720p"
>   
>   VIDEO_FILES_keystone = "video_720p "
>   
> -SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1279/7769/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
> +BRANCH = "master"
>   
> -S = "${WORKDIR}/amsdk-av-files"
> +SRC_URI = "git://git.ti.com/processor-sdk/amsdk-av-files.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "1b73009090265328ebaf1b6c880dfeccae5a8f19"
> +
> +S = "${WORKDIR}/git"
>   
>   do_compile() {
>       :
> @@ -42,5 +46,3 @@ do_install() {
>   
>   FILES_${PN} += "${datadir}/ti/*"
>   
> -SRC_URI[avfilestarball.md5sum] = "29a2f8b5f41f49e30bbe9cf53eb06c5a"
> -SRC_URI[avfilestarball.sha256sum] = "64dde10d03156d480c6f38494c9503e73878fa0a8d5009182ed43b0e926b5569"

