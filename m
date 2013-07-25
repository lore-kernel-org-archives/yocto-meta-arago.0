Return-Path: <sajesh@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3A46F529D3
	for <meta-arago@arago-project.org>;
	Thu, 25 Jul 2013 20:30:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6PKU8Bc008844
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 15:30:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6PKU8UV008358
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 15:30:08 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 25 Jul 2013 15:30:08 -0500
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] compiling a native (x86) application using Yocto
Thread-Index: Ac6ImMQDGnryB0yHRnSnNiDIqcHy8wBBieKAAApUnMA=
Date: Thu, 25 Jul 2013 20:30:07 +0000
Message-ID: <8EAE6244CE843044A42356038645C8551573D779@DFLE12.ent.ti.com>
References: <8EAE6244CE843044A42356038645C8551573CB16@DFLE12.ent.ti.com>
	<20130725202449.GD2222@edge>
In-Reply-To: <20130725202449.GD2222@edge>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: compiling a native (x86) application using Yocto
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
X-List-Received-Date: Thu, 25 Jul 2013 20:30:12 -0000
X-Groupsio-MsgNum: 1698
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_8EAE6244CE843044A42356038645C8551573D779DFLE12entticom_"

--_002_8EAE6244CE843044A42356038645C8551573D779DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Recipe is attached with the mail.

Regards,
Sajesh

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, July 25, 2013 4:25 PM
To: Saran, Sajesh Kumar
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] compiling a native (x86) application using Yocto

On Wed, Jul 24, 2013 at 06:26:48PM +0000, Saran, Sajesh Kumar wrote:
> Hi,
>=20
> I am trying to compile a native tool/application using Yocto.
>=20
> I have added BBCLASSEXTEND =3D "native" to the recipe. The compilation=20
> goes thru fine. But, in do_package_qa it is running a strip command=20
> using arm-linux-gnueabihf-strip, which is failing because the=20
> application is compiled using gcc. Do I have to anything else to fix of t=
his issue?

Strange, that should be enough... Care to share the recipe?

--
Denys

--_002_8EAE6244CE843044A42356038645C8551573D779DFLE12entticom_
Content-Type: application/octet-stream; name="ti-dspcoreparse-native_git.bb"
Content-Description: ti-dspcoreparse-native_git.bb
Content-Disposition: attachment; filename="ti-dspcoreparse-native_git.bb";
	size=626; creation-date="Thu, 25 Jul 2013 20:29:36 GMT";
	modification-date="Wed, 24 Jul 2013 18:15:33 GMT"
Content-Transfer-Encoding: base64

REVTQ1JJUFRJT04gPSAiRFNQIGNvcmVkdW1wIHBhcnNlIHV0aWxpdHkiCkxJQ0VOU0UgPSAiQlNE
IgojIENPTVBBVElCTEVfTUFDSElORSA9ICJrZXlzdG9uZS1ldm0iCkxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL01ha2VmaWxlO2JlZ2lubGluZT0xO2VuZGxpbmU9MzE7bWQ1PTY3MDEwNjFjYzQz
ZDQyYWMyMmE5N2FjYzA3NGNmODIwIgoKUFIgPSAicjYiCklOU0FORV9TS0lQXyR7UE59ID0gIlRy
dWUiCkJSQU5DSD0ibWFzdGVyIgpTUkNfVVJJID0gImdpdDovL2FyYWdvLXByb2plY3Qub3JnL2dp
dC9wcm9qZWN0cy9tY3Nkay1hcHBzLmdpdDtwcm90b2NvbD1naXQ7YnJhbmNoPSR7QlJBTkNIfSIK
UyA9ICIke1dPUktESVJ9L2dpdC9kc3Bjb3JlcGFyc2UiClNSQ1JFViA9ICJERVYuTUNTREstMDMu
MDAuMDEuMTIiCgpkb19pbnN0YWxsICgpIHsKIyAgICAgICAgaW5zdGFsbCBERVNURElSPSR7RH0g
U0JJTkRJUj0ke3NiaW5kaXJ9IE1BTkRJUj0ke21hbmRpcn0gSU5DTFVERURJUj0ke2luY2x1ZGVk
aXJ9CglpbnN0YWxsIC1kICR7RH0ke3NiaW5kaXJ9LwoJaW5zdGFsbCAtYyAtbSA3NTUgJHtTfS9k
c3Bjb3JlcGFyc2UgJHtEfSR7c2JpbmRpcn0vCn0KCkJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgo=

--_002_8EAE6244CE843044A42356038645C8551573D779DFLE12entticom_--
