Return-Path: <zhoujt@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EF33652A1D
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 22:25:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1BMPeBY014864
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 16:25:40 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1BMPerZ012876
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 16:25:40 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 11 Feb 2013 16:25:40 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] lzo recipe
Thread-Index: Ac4ErxbwEGmwxkLfT4GyTjlraUvw8AEF2n8AAAoczwA=
Date: Mon, 11 Feb 2013 22:25:40 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391820B@DFLE09.ent.ti.com>
References: <3C08AEEB3C731745938BC83D029FE5E3917A22@DFLE09.ent.ti.com>
	<20130211201310.GD11440@edge>
In-Reply-To: <20130211201310.GD11440@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: lzo recipe
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
X-List-Received-Date: Mon, 11 Feb 2013 22:25:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

1. I don't know where it fits.(The lzo_2.06 is in oe-core)

2. Now I recall why I re-added it. Vtun_2.6(I know it's a very old version,=
 released in 2003) depends on lzo_1.08. I added a vtun patch to be compatib=
le with lzo_2.06.=20

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, February 11, 2013 3:13 PM
To: Zhou, Jingting
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] lzo recipe

On Wed, Feb 06, 2013 at 09:15:44PM +0000, Zhou, Jingting wrote:
> Hey all, attached is the recipe for lzo. Please take a look. Thanks~

1. Why did you put it in recipes-connectivity?

2. Why do you even need to re-add it? oe-core already provides lzo_2.06

--=20
Denys

