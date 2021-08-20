Return-Path: <paul@pbarker.dev>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by arago-project.org (Postfix) with ESMTPS id 4C62552A5F
	for <meta-arago@arago-project.org>;
	Fri, 20 Aug 2021 09:26:17 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 5E16E320094F;
	Fri, 20 Aug 2021 05:26:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute2.internal (MEProxy); Fri, 20 Aug 2021 05:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type; s=fm1; bh=FNSU51uHWF/1MUXMWT+gCQhEE/
	A8qwuipfmK89sQXc8=; b=kHQu1Wuie3U85sd9e0wHHcljjOEbvc0eIJ2BhcfBDC
	Uv9+zA6b2ZqMsbFafBtq685O9HC99LfLRnWLNmGvTMvR9oP25ObHOdw1/KC92LiY
	NL96zHmqQdRRs+QjpqOYYO/Xuu0xlNi+kdTo7y5h3YspoLQlod94lJlgLDmXQVgX
	KGQ7sr8GZL/vbOT1LwVrOHIf1HDap548r/5vAmtBtjunbOKDMY57zyQdjhQHW8QP
	jWrBta1p6t0vWKVmZa3A7ajzIVT1bANQgcN4HJ4AhpTDy5Fz9nXjzELkZi5mI0aL
	EHSApbyC5dIkdbF+nx5LKXjRAd771nkw8IhNTqA3u1cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FNSU51
	uHWF/1MUXMWT+gCQhEE/A8qwuipfmK89sQXc8=; b=sI8sQKU3X9W07k4xZEP03h
	x44HhjXGL7FJa47TKkzNkscx27z9CJrTUr+hREnMLT1+MtXvk6C+z9r11UUywS3m
	s3GbD1+EanJGnj/nEBuiFBDTxGLiIRAWIRBkaWU6saJ+mpDirhKnMWlTHvECq89G
	snuBQXRi9rj/kIsSad6GeA744wk85ViBsLAYFxFChBj0NyCvvvHKCjcF8fZFb48Q
	G1cQKW8ZP2AYwIdqZZPQDCk0Io1enZB5MA4Em+HBZTbFNQ3hPm85DJmO9BQRoi+b
	IWlvhsNVSMYHPJf+0yoBG5Zc8Z7jk4Io61LWOLFBWcM0fMQ1XaHL11px1G2CB11Q
	==
X-ME-Sender: <xms:TnUfYXykLf3vnemfSxDbCFPU1TEqXYBwh-947Z5_qgdQu87O-Ijr4w>
	<xme:TnUfYfSMfECDiz7UuVIP6S0yXEyxI_sFNn6tlt-lIGqL5Fzn2UyZMh9I6I4Hw1byw
	Hx1IrSjHT_8xc38_Fg>
X-ME-Received: <xmr:TnUfYRWU-9vWkuz2FW8U5wE_iZNY8Uw6Op41MeGYm_liOVtZcGXWzz2xOe8qUl3i1cmBGLqRadQLjGazGGzZqWaFvtMhFjhJNg2eXbdAkW8sWfbJPX51r5uSI8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleelgdduhecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpeffhffvuffkjghfofggtgesghdtreerredtvdenucfhrhhomheprfgruhhluceu
	rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
	epkeeileehudettdeuudetffehgfekvdefuefghedvtdegheffudeiheevueetffefnecu
	ffhomhgrihhnpegrrhgrghhoqdhprhhojhgvtghtrdhorhhgpdhtihdrtghomhdpphgsrg
	hrkhgvrhdruggvvhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
	fhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:TnUfYRhXaK_Leqx2qoR0-iLldV3l9b5PDvQFXkoZZrCfMoOt36eF-g>
	<xmx:TnUfYZBpEMQBsdalAwzy2JOSyVKoadiy3zp-2PcNExgeWapFrvWWNg>
	<xmx:TnUfYaLueustZsVqVruKYNbG_ZhzMh5IHhOJg_qi567yA7PokzGWIQ>
	<xmx:T3UfYW4tWgT-ZDNjprh_sC8lMzTzuAyIBgjFvbMSGc5PD9U1zsH-mw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
	20 Aug 2021 05:26:38 -0400 (EDT)
Date: Fri, 20 Aug 2021 10:26:21 +0100
From: Paul Barker <paul@pbarker.dev>
To: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <20210820102621.11d35af0.paul@pbarker.dev>
In-Reply-To: <ca2676c6-045f-cff2-1f52-15a18328b3ea@ti.com>
References: <20210819165755.6156c40c.paul@pbarker.dev>
	<ca2676c6-045f-cff2-1f52-15a18328b3ea@ti.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: meta-arago@arago-project.org
Subject: Re: Rebase of oe-layersetup?
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
X-List-Received-Date: Fri, 20 Aug 2021 09:26:17 -0000
X-Groupsio-MsgNum: 13305
Content-Type: multipart/signed; boundary="Sig_/C4cm7rJnniALD8Q+HQq.oCy";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C4cm7rJnniALD8Q+HQq.oCy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Aug 2021 20:00:52 -0500
"Siraswar, Yogesh" <yogeshs@ti.com> wrote:

> Hi Paul,
> I guess you are still using oe-layersetup from=20
> https://arago-project.org. Since arago-project.org will be sunset in=20
> mid-2022 we are migrating to=20
> https://git.ti.com/cgit/arago-project/oe-layersetup.
> There was sync issue with git.ti.com that resulted in force-update.
> Could you please start using=20
> https://git.ti.com/cgit/arago-project/oe-layersetup so that you do not=20
> see any disruption when arago-project.org is sunset.

Many thanks for the info Yogesh, that's all good to know. I'll update
my clone of the repository to point to the new upstream.

I recommend updating the Arago Project front page [1] to announce the
migration, that would probably help other users.

[1]: http://arago-project.org/wiki/index.php/Main_Page

--=20
Paul Barker
https://pbarker.dev/

--Sig_/C4cm7rJnniALD8Q+HQq.oCy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCYR91PQAKCRCrY1Tsnbr0
blq/AP0TX6ua6vC76TYnJwX70pm9qFwmm1Azvv43cazrrMRc8AEAxJvhTb9moKlH
0b6VByj23k1pWLsppOibY5c5KZc6pwo=
=IIQE
-----END PGP SIGNATURE-----

--Sig_/C4cm7rJnniALD8Q+HQq.oCy--
