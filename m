Return-Path: <zhoujt@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A4A2452A20
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 20:25:45 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1BKPjoJ014252
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 14:25:45 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1BKPjS8011809
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 14:25:45 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 11 Feb 2013 14:25:44 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] new image recipe
Thread-Index: Ac4Er3IsOvywzyKFTnWWMbtrbte9DAEFlj2AAAwCjIA=
Date: Mon, 11 Feb 2013 20:25:44 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391813D@DFLE09.ent.ti.com>
References: <3C08AEEB3C731745938BC83D029FE5E3917A77@DFLE09.ent.ti.com>
	<20130211200804.GB11440@edge>
In-Reply-To: <20130211200804.GB11440@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Feb 2013 19:49:44 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: new image recipe
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
X-List-Received-Date: Mon, 11 Feb 2013 20:25:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

1. I'll use another name
2. the white spaces are consistent in my computer......

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, February 11, 2013 3:08 PM
To: Zhou, Jingting
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] new image recipe

On Wed, Feb 06, 2013 at 09:18:15PM +0000, Zhou, Jingting wrote:
> Hey all, attached is the recipe for a new image=20
> arago-headless-tisdk-keystone2-image. Please take a look. Thanks~

All the comments I made to your previous patch are still applicable here,
plus:

1. Don't make tasks or images specific to a machine/SoC like that. First of=
 all, you can avoid making it completely machine-specific and second, you m=
ay need to use overrides in the recipe itself for really specific things.

2. Please make sure the whitespaces are consistent.

--
Denys

