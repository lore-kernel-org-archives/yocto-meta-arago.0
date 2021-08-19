Return-Path: <paul@pbarker.dev>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by arago-project.org (Postfix) with ESMTPS id EDCAC52A6A
	for <meta-arago@arago-project.org>;
	Thu, 19 Aug 2021 15:57:48 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id A343632009D4;
	Thu, 19 Aug 2021 11:58:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute6.internal (MEProxy); Thu, 19 Aug 2021 11:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	date:from:to:subject:message-id:mime-version:content-type; s=
	fm1; bh=WbiVpCX9/ngfW4Ow5kV9Yv7qaLaX/sVDeaXNMiAJK/o=; b=WW3hQU/x
	QDjdX1epnMaxWXqEmK7ZlErc2l4bDDuwHFUfL0di2Vw6ryaXxE4t5UKB7p8j+YKE
	CsCXRGvjc3Y5Mfn1jcdffdoV4VRHzbrlG3xgNuu7xn3lpnPtOvkan5usfwSIIyoD
	RxI9+rYYZ9UFWGSrQpULTSwsbe2BK5hR07nTXCSCOznhCtH2U6N14aTrLgj1Cwdq
	5AAhMXJbByA7ZH0sc9BViIBkVh761AvabsjBuE7sDrz80GDvynfzYYU57Nud8uDb
	Rff9HrAPFFlG4BllWqKE9ekSHdiEB3OdJv3HLm+GDkI+hhuSHgBsSb/i1KcCQu4/
	Xo1TAg88/lXOxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=WbiVpCX9/ngfW4Ow5kV9Yv7qaLaX/
	sVDeaXNMiAJK/o=; b=juHZYCt3dim2GvVas7wyG7rvllpQKU/Jb13BB7N3CQqwt
	b4AoCl7wH/NPz2dSP5VJI6iTa57ZkNnYi9zdPOGP2kM6I3gqrxmKV9nyP6Dutfbs
	k3+/tulWBLvK6m4LVMW2ncTjZo57BE024lBMAnhig08S8WRpfJ7llcV/MeueHwk/
	hxCzNWtBnGCDWlGGdApnK7sKJZOLJESmKLAXGZdaDo21kajD198tCkkBiRtdey+N
	zYI/Kclstl2YZZQsre89yWVNiysSDGbbxLDVHHnqsBRbV3xOh7tTXLoz597i8VJS
	LxuYsGhqJopWa3QMDTyHNpX0DHOGQc1sUjSJslN2Q==
X-ME-Sender: <xms:kX8eYUCqBghRPXlGZAJm55Aan0W8PgYi4s9uwFOmngQMwPK-QgDvsw>
	<xme:kX8eYWgZwiLv8ulfA1fg2vJAVyYJ9o1HrWY62eYwzPyvCpy0ouc_RSHSxX67CdIMv
	KNDA6jlPUtD3Y9JHlY>
X-ME-Received: <xmr:kX8eYXmZuMJyggntd6CJquxTnyFyTXtcgkUDCNgQ0vNUJdNZUhiDJqxGqQiUSPGHTpaeK3csYDUO6lOR4e5Mc7k0GqYlzvxGeK9U4BfWiqAdQn2kddvGBTvoAYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdelvdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpeffhffvuffkofggtgesghdtreerredtvdenucfhrhhomheprfgruhhluceurghr
	khgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepue
	fgvefhheeiffetvdfhleeltdduteekleekvdffieekvefhgfdvledugfeivdefnecuffho
	mhgrihhnpehpsggrrhhkvghrrdguvghvnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
	hrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:kX8eYax663BlIe4YhpJxSs7mU7b-UiYBqXCshA6UOYjzuJD0Lj8fHA>
	<xmx:kX8eYZSHTR-KxQWS9dfysgvc-m0H1j1VDRgsChG57rVoITevhX8dlw>
	<xmx:kX8eYVZOKNGF69Zx36cynFoNn4oFN-wTVWL1th3fZPZy7Uv69FBieA>
	<xmx:kn8eYYKvvnl_G2s0PUhHYRPDZetcN0YqUNXoUjocgJwbxba27zz8Mw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
	19 Aug 2021 11:58:09 -0400 (EDT)
Date: Thu, 19 Aug 2021 16:57:55 +0100
From: Paul Barker <paul@pbarker.dev>
To: meta-arago@arago-project.org, Praneeth Bajjuri <praneeth@ti.com>, Yogesh
	Siraswar <yogeshs@ti.com>
Message-ID: <20210819165755.6156c40c.paul@pbarker.dev>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Rebase of oe-layersetup?
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
X-List-Received-Date: Thu, 19 Aug 2021 15:57:49 -0000
X-Groupsio-MsgNum: 13303
Content-Type: multipart/signed; boundary="Sig_/JSDC/6pfYEEsC5PvMlmsbkd";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JSDC/6pfYEEsC5PvMlmsbkd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi folks,

Was there a force push or rebase of the master branch of the
oe-layersetup repository?

I previously had commit efa23526343a48255bc0cf566ecd9e4fd625ba89
"processor-sdk: Add 08.00.00.21 release config". It looks like this has
been stripped out and instead the HEAD of master is now
d7c7f2cf567448ef0e2e0bb8d98f819856a96c0d "processor-sdk: Add
08.00.00.21 release config". Both commits have their parent as
60df5effd05fbe42fe3b3a5806eb5cac161e51cc "coresdk-08.00.00.004-config:
add config for CoreSDK 08.00.00.004 release".

This has broken the automatic update of my copy of the oe-layersetup
repository so I'd like to confirm which commit is the correct HEAD and
if it did change then why did it change?

Thanks,

--=20
Paul Barker
https://pbarker.dev/

--Sig_/JSDC/6pfYEEsC5PvMlmsbkd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCYR5/gwAKCRCrY1Tsnbr0
bjHWAQCSscwN273SGk0UEe4i7sCbObD7Kl5D6SjU+1M1h9d59gD/U0hmOwyDbHYL
KAOnA7d9wyJslUOQCH/MtyL66+9rFAk=
=Cs8h
-----END PGP SIGNATURE-----

--Sig_/JSDC/6pfYEEsC5PvMlmsbkd--
