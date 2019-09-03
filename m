Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6A73B529E4
	for <meta-arago@arago-project.org>;
	Tue,  3 Sep 2019 21:23:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x83LMLY2128093
	for <meta-arago@arago-project.org>; Tue, 3 Sep 2019 16:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567545741;
	bh=NQaaz0om2VN/8fdUbkudI0z84Oi7AxNyx09q8WwkAYI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=vZD6vvvO8fwdVAPB4FWh7/e/46FLkJy7ne1z22W3G4Tz0Vz52VcQ2YN4aBjA448fb
	BNvNOz+JyYEtv319TBebr3R4bRHnEvRWdPIo0lywgEX0aSt1AR+1vr+aIwBaVNm6HI
	ZdgviichqpmB1MWjfmokLtlMBl+1jRc9o5MFRAqU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x83LMLu4014453
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 3 Sep 2019 16:22:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 3 Sep 2019 16:22:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 3 Sep 2019 16:22:21 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x83LMKmY034138;
	Tue, 3 Sep 2019 16:22:21 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1567542009-38879-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <afe884c5-d483-0c75-5ed3-d2fe05564a41@ti.com>
Date: Tue, 3 Sep 2019 17:22:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567542009-38879-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] rng-tools: remove duplicate initscript and wait for module load
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
X-List-Received-Date: Tue, 03 Sep 2019 21:23:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I manually made these changes to an existing filesystem, rebooted a few 
times, and observed the service status. The service was up every time 
and there was no delay in the service terminating when rebooting.

Tested-by: Jacob Stiffler <j-stiffler@ti.com>

On 9/3/2019 4:20 PM, Denys Dmytriyenko wrote:
> Since Arago still has a mix of SysVinit iniscripts and systemd unit files, it
> enables both of the DISTRO_FEATURES, resulting in some duplication. It appears
> that rngd currently has a problem handling signals when forked in daemon mode.
> Hence, drop SysVinit initscript in favor of systemd service, as the latter one
> starts rngd in foreground. Also, add udev dependency rule on omap_rng module.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../recipes-support/rng-tools/rng-tools/rngd.rules          |  1 +
>   .../recipes-support/rng-tools/rng-tools_%.bbappend          | 13 +++++++++++++
>   2 files changed, 14 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
>   create mode 100644 meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
>
> diff --git a/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules b/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
> new file mode 100644
> index 0000000..a21c99b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
> @@ -0,0 +1 @@
> +ACTION=="add", SUBSYSTEM=="module", KERNEL=="omap_rng", TAG+="systemd", ENV{SYSTEMD_WANTS}+="rngd.service"
> diff --git a/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
> new file mode 100644
> index 0000000..df84536
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
> @@ -0,0 +1,13 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +PR_append = ".arago0"
> +
> +SRC_URI += "file://rngd.rules"
> +
> +do_install_append() {
> +	# remove duplicate initscript
> +	rm -f ${D}${sysconfdir}/init.d/rng-tools
> +
> +	install -d ${D}${sysconfdir}/udev/rules.d/
> +	install -m0644 ${WORKDIR}/rngd.rules ${D}${sysconfdir}/udev/rules.d/
> +}

