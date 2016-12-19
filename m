Return-Path: <robertcnelson@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by arago-project.org (Postfix) with ESMTPS id 2C1E652A85
	for <meta-arago@arago-project.org>;
	Mon, 19 Dec 2016 15:58:56 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id h30so155728898iod.2
	for <meta-arago@arago-project.org>;
	Mon, 19 Dec 2016 07:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sty9WcF/YDkH4YWftWZ/THeXKviunZXX7+SbLiij4HU=;
	b=cpBvVmP5waxw3Hsrs+Sh2XqKSiRYUjeBuVfj3F6IE8Sbwm1FWuggCphFD6QMmwqQ8q
	+Xs4R2IQ1J/86ogbIGIvAg8sVqnf9TU6Q347S12dZGx48NL0HY2mXv62h7oDj7ieogSR
	hvQbXfrM6/v1zzi49nCSY0d41jzNafLSIoGGiky2L0N0Px/QbZ018IcBQYuUTfPhr6c1
	rimLUgKIwka9HmJiuAtrSQUukkubOt4+nEiTG9EZLiFnx3/5qZxtH3Dc9vfdOmkccmVZ
	jhdF4hSdyfN3leIux4LQ/+wdAR6R+w57M/ve2vfV7DdhHVJwgxUmanJW7xuruuAbo9Dq
	ZAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sty9WcF/YDkH4YWftWZ/THeXKviunZXX7+SbLiij4HU=;
	b=jTmVizc0aZ6FvVAJUMwJtSWi+Mteg88ut11uppViAt+AF+F+JjX2Kw5DBVqg62Bz2d
	cpORND/Ifjkm/UNhlXffzzMHfmxnkwyNDme9Ikvlp15u7A96A6Jrrq7Z4H35/V7SCI/d
	6PSFp/BLRPqzl/49YkHDh2HzBz+UZ3s9bFz73IQ6boqCgvrGzAXzQqxO1i1/xjwn23Mz
	kEfUFKhRVMELBq8GsknpGQZ6PVuePxx2m/JJ5UrumPs12J1mQGWSNg31vs6pX2LaIibY
	A6LleKMoQEJAELVkgBmqvx5Klq6C3ZXMUO5L3e7Js/OsIoDYYZ0lfBfLRSJLniuJZp0X
	tVcA==
X-Gm-Message-State: AKaTC036JLa/lGP6+82sC1Ja+YLphNlNpQZkl+gZU6Dsoc8dAcUori8V3KNHXHzHvVMQHs3rV4KE1Nk4m2e/hg==
X-Received: by 10.107.149.13 with SMTP id x13mr16180730iod.57.1482163135984;
	Mon, 19 Dec 2016 07:58:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.58.197 with HTTP; Mon, 19 Dec 2016 07:58:25 -0800 (PST)
In-Reply-To: <1482158228-14771-1-git-send-email-j-stiffler@ti.com>
References: <1482158228-14771-1-git-send-email-j-stiffler@ti.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Mon, 19 Dec 2016 09:58:25 -0600
Message-ID: <CAOCHtYiy6pP4u7zJ=FxuMjbG9Hppb3aDA26EJ4GLmE+kwbJkEA@mail.gmail.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] configs: add processor-sdk-03.02.00.05-config
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
X-List-Received-Date: Mon, 19 Dec 2016 15:58:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 8:37 AM, Jacob Stiffler <j-stiffler@ti.com> wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  configs/processor-sdk/processor-sdk-03.02.00.05-config.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
>
> diff --git a/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
> new file mode 100644
> index 0000000..71a4ad1
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
> @@ -0,0 +1,14 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
> +meta-processor-sdk-internal,ssh://git@bitbucket.itg.ti.com/processor-sdk/meta-processor-sdk-internal.git,03.02.00-linux,0aaccbf7c4d22a16aeff3daf94c1b3a9c3cca541,layers=

"internal"...

git clone ssh://git@bitbucket.itg.ti.com/processor-sdk/meta-processor-sdk-internal.git
Cloning into 'meta-processor-sdk-internal'...
ssh: Could not resolve hostname bitbucket.itg.ti.com: Name or service not known
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

> +meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,3678d672c9c47a646897286281d4260ac4ace960,layers=
> +meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,76381bbc10b93ffc6c014154814872b170b93796,layers=meta-arago-distro:meta-arago-extras
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
> +meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,d8aa76970a0ba48762c631dfd79dbed49222373b,layers=
> +meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
> +oe-core,git://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
> --
> 1.9.1

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

