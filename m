Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 532E4529E4
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2019 14:17:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89EGYho087791
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 09:16:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568038594;
	bh=ORtmzyyR92W31znUwsKLpBucMGlMs+EC/WVf4MkIImQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=SpC8TC0DQYRdERXwLe7DAzBa2FnmB9MeYu3t1pUQBUjGJyUYSwoo//55BxR+VukDE
	VIGbfqiqMO4iiGF3WFl9h3S6pE0oveur6Xc5/w5Z5O0EN7ylE9LbRWR1ON34tf2FoU
	B3c/rvvSbraNgRz8OPATRqB5rmQ6gtBhl2GSGa4k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89EGYJq121384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 09:16:34 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 09:16:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 9 Sep 2019 09:16:34 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89EGXKN045810;
	Mon, 9 Sep 2019 09:16:34 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1567617940-18452-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b709573c-141f-0bb2-a9cf-78da52e67498@ti.com>
Date: Mon, 9 Sep 2019 10:16:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567617940-18452-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH v2] rng-tools: remove duplicate initscript and wait for module load
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
X-List-Received-Date: Mon, 09 Sep 2019 14:17:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you backport this to ti2019.03?


Thanks,

Jake

On 9/4/2019 1:25 PM, Denys Dmytriyenko wrote:
> Since Arago still has a mix of SysVinit iniscripts and systemd unit files, it
> enables both of the DISTRO_FEATURES, resulting in some duplication. It appears
> that rngd currently has a problem handling signals when forked in daemon mode.
> Hence, drop SysVinit initscript in favor of systemd service, as the latter one
> starts rngd in foreground. Also, add udev dependency rule on omap_rng module.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - since dropping initscript, disable corresponding update-rc.d processing
>
>   .../recipes-support/rng-tools/rng-tools/rngd.rules        |  1 +
>   .../recipes-support/rng-tools/rng-tools_%.bbappend        | 15 +++++++++++++++
>   2 files changed, 16 insertions(+)
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
> index 0000000..2a7810f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
> @@ -0,0 +1,15 @@
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
> +
> +INHIBIT_UPDATERCD_BBCLASS = "1"

