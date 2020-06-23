Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by arago-project.org (Postfix) with ESMTPS id 128EA529BC
	for <meta-arago@arago-project.org>;
	Tue, 23 Jun 2020 08:14:47 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 72so2161068otc.3
	for <meta-arago@arago-project.org>;
	Tue, 23 Jun 2020 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=OTrW7B+VmTO8vkN1O6stx489kQdh5tZXOOfpXEWke7E=;
	b=tWBETkCnPbgq2nPPLtLvf8VEl458lF3tGNEI+yUR/oqCYnrkgIzXBaXgCKiQFa6pNF
	3hpmsyNjlnj5S57eGVpPXFLGcSSIz/ah57qwAqWZGq6l15ckhXiKrlIPM3fqjOriEaWz
	nUXC2REX6bcwZGqQ/gU7ipg6bjY7MueRiQ7Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=OTrW7B+VmTO8vkN1O6stx489kQdh5tZXOOfpXEWke7E=;
	b=VmTGEX3gbSEhLpBMzVyR3FpG78LR9uOIoAaAsQP/Q6Evw7t5u8PWl7yz6rQxtAzAQY
	C5AuwLiOz59oi2tK6KV9Qs6h0FWnB20dGIMSBgVvNSnPgHDtWNWDwyYT5G+1dXmDny1r
	5oDjz9Cvx6uIdXA8JQohKagOwzi+BUdCgrSe7eoVvLacB4qmELhRvjTvoyT9V+Ch/1Nh
	BDKMeq84p2M7LVlmaGX+eOsBO59aMvAs0MSvtFJBvDQHtnI17J2idUT4oFyRX/+R3tdC
	v37FAZeOn4YYenU1VueoZPdurELRa5OEaEqkJOwy7TLmNlSJ1DyAHFiOU7CcG5RJGcDO
	7o7g==
X-Gm-Message-State: AOAM533WxzSSe772edE4wVEGRRwWoTCgEHZLgmq6o7eJ8Xwrh/j4X6ba
	McjyO6/ByRmF8IxhXea74knwsRGhfRV6HZ3tjUoQItPk
X-Google-Smtp-Source: ABdhPJzrGnBi8A9wmxkT8TrSUACrT3AShEHZGRYC66y+oYnuYCLxrQ6lAN7pwSrQ/oTjEO1jQ64rsXwUDROesXknZ4o=
X-Received: by 2002:a9d:6c02:: with SMTP id f2mr2342015otq.258.1592899930844; 
	Tue, 23 Jun 2020 01:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200609102808.16475-1-pbarker@konsulko.com>
In-Reply-To: <20200609102808.16475-1-pbarker@konsulko.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Tue, 23 Jun 2020 09:12:00 +0100
Message-ID: <CAM9ZRVsOEN9Q0jwufihfeGu=pAXbu4fqUUvt8YQC=pnF7DQJ0Q@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Re: [master/dunfell][PATCH] packagegroup-arago-sysvinit-boot: Skip recipe if sysvinit is not enabled
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
X-List-Received-Date: Tue, 23 Jun 2020 08:14:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2020 at 11:28, Paul Barker <pbarker@konsulko.com> wrote:
>
> This change fixes the following error seen at parse time when the
> meta-arago-distro layer is present but sysvinit is not in
> DISTRO_FEATURES:
>
>     ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
>     ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  .../packagegroups/packagegroup-arago-sysvinit-boot.bb        | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> index 2eb2d777..a6e21745 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
> @@ -1,3 +1,8 @@
> +python __anonymous() {
> +    if not "sysvinit" in d.getVar("DISTRO_FEATURES").split():
> +        raise bb.parse.SkipRecipe("sysvinit is not enabled")
> +}
> +
>  require recipes-core/packagegroups/packagegroup-core-boot.bb
>
>  PR = "r0"
> --
> 2.26.2
>

Ping.

-- 
Paul Barker
Konsulko Group

