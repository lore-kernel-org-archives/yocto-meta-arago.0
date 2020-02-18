Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172])
	by arago-project.org (Postfix) with ESMTPS id 07D7352994
	for <meta-arago@arago-project.org>;
	Tue, 18 Feb 2020 19:43:13 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id c16so21351051oic.3
	for <meta-arago@arago-project.org>;
	Tue, 18 Feb 2020 11:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TnlHSHnLMefLs1dg7KptEXv2wXlZ3AkamweVWf29EEA=;
	b=rON2cGe3esFyYkpLb5OEPDcXQ0Saf+4glFT7FKEQwKsf+gxB4PZKXmFlbP3DyObBw5
	jp5BcodeqsxmdWeJj4l1HAEdW5ddREdJB1YBzYErLyJQYBPZ77OKLdq5F5NU8WdqiEBp
	YgEUSUz9vZ2hevnUhrbsaq65GfblrXwkzW2X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TnlHSHnLMefLs1dg7KptEXv2wXlZ3AkamweVWf29EEA=;
	b=O/zdGN4kqqlNBVy6J4kkeMcP2zvZGtbmcSOsme4azZ4EsZeLYrVi5KyZ1qRyxobh5/
	jPf4RGs4muvjWC8O2l1r/LxUjBJMMkhoBISvYO374A0n9TTNhyE1ObMjidWIvr9WZNlh
	HpnzJvj5D/ftuF2o15mE21Uf38JVdXte8ik3c14wc9k3xuhzpe1v0y6iLDqxtCkWQG3T
	05ciqKuKFOno96iUn/xx8HObMZ8+IWTX7I5rg/1WVqAcimcLAF1Ue1nYCK04qZrg3QwK
	cQAxCr54r6MiJbC1owCisyK5NsCq3AANpRpgms19evQUHkmr4URDnGlWfQhP86XsdbNZ
	4LRA==
X-Gm-Message-State: APjAAAUFNoEcoK4SoVA6NlqeLpUbZhTtTyy1tQZsh0ubgrZp5JO6hJXQ
	zkmLrAqdccvTqs2P3bKxiqfmYq7wSZO1S3bWjISOJQ==
X-Google-Smtp-Source: APXvYqz5sLD/MyB0dQGJHNxKuaaA4QvPFUEtuKOonuEE7+Rh/Q79O2J+n+PnPOrtH8JE34L1VJuYnlj2oYKGroUlS8g=
X-Received: by 2002:aca:4e10:: with SMTP id c16mr2218339oib.6.1582054875675;
	Tue, 18 Feb 2020 11:41:15 -0800 (PST)
MIME-Version: 1.0
References: <CAM9ZRVsu3xHM4AS=8=Ver_j75inMAefZCH3231J6r6d1upg_tA@mail.gmail.com>
	<20200218175921.GK720@beryl>
In-Reply-To: <20200218175921.GK720@beryl>
From: Paul Barker <pbarker@konsulko.com>
Date: Tue, 18 Feb 2020 19:41:04 +0000
Message-ID: <CAM9ZRVueKn8N2k+ADCAY3u40aaOr6V83=xuoqR_AZ09mwmK_LA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: SDK support in Arago with ARM toolchain
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
X-List-Received-Date: Tue, 18 Feb 2020 19:43:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2020 at 17:59, Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Tue, Feb 18, 2020 at 03:37:54PM +0000, Paul Barker wrote:
> > Hi all,
> >
> > I'm currently seeing several failures when trying to run `bitbake
> > tisdk-rootfs-image -c populate_sdk` with the Arago distro and the
> > external ARM toolchain enabled. Is this expected to be supported?
>
> I have this patch pending:
> http://arago-project.org/pipermail/meta-arago/2019-November/012088.html
>
> It was part of a separate internal testing branch, which will be merged to
> zeus soon.

Thanks Denys, will give that a test and see if it helps.

