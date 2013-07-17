Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1EEF052A91
	for <meta-arago@arago-project.org>;
	Wed, 17 Jul 2013 21:28:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6HLSehF029134;
	Wed, 17 Jul 2013 16:28:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6HLSeRW008595;
	Wed, 17 Jul 2013 16:28:40 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 17 Jul 2013 16:28:40 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "chgans@gna.org" <chgans@gna.org>
Thread-Topic: [meta-arago] [arago/yocto-1.3] crda and python-m2crypto
Thread-Index: AQHOgRsutUEyp3+PgkSy1EYBSUAAd5lnmfcAgACOaACAAT6geA==
Date: Wed, 17 Jul 2013 21:28:40 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E8378B6@DLEE08.ent.ti.com>
References: <51E386CF.9030704@gna.org>
	<7D46E86EC0A8354091174257B2FED101596576BD@DLEE11.ent.ti.com>,
	<51E5BAF0.10206@gna.org>
In-Reply-To: <51E5BAF0.10206@gna.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [arago/yocto-1.3] crda and python-m2crypto
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
X-List-Received-Date: Wed, 17 Jul 2013 21:28:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E8378B6DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E8378B6DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

BTW, m2crypto seems to be broken in meta-arago, if I remember correctly, as=
 I had to install my host package too...


Denys


-----Original Message-----
From: Christian Gagneraud [chgans@gna.org]
Received: Tuesday, 16 Jul 2013, 17:28
To: Maupin, Chase [chase.maupin@ti.com]
CC: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: Re: [meta-arago] [arago/yocto-1.3] crda and python-m2crypto

On 17/07/13 00:58, Maupin, Chase wrote:
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Christian Gagneraud
>> Sent: Monday, July 15, 2013 12:21 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [arago/yocto-1.3] crda and python-m2crypto
>>
>> Hi,
>>
>> While building an image with arago-stable/yocto-1.3, I encountered
>> an error:
>> DEBUG: Executing shell function do_compile
>> NOTE: make -j 8 MAKEFLAGS=3D all_noverify
>>    GEN  keys-gcrypt.c
>>    CC   crda.o
>>    CC   intersect.o
>>    Trusted pubkeys: pubkeys/linville.key.pub.pem
>>    CC   print-regdom.o
>>    CC   regdbdump.o
>> ERROR: Failed to import the "M2Crypto" module: No module named
>> M2Crypto
>> Please install the "M2Crypto" Python module.
>> On Debian GNU/Linux the package is called "python-m2crypto".
>> make: *** [keys-gcrypt.c] Error 1
>> make: *** Waiting for unfinished jobs....
>> ERROR: oe_runmake failed
>> ERROR: Function failed: do_compile (see
>> /home/christiaga/projects/yocto/arago/build/arago-tmp-external-
>> linaro-toolchain/work\
>> /armv7ahf-vfp-neon-oe-linux-gnueabi/crda-1.1.1-
>> r0/temp/log.do_compile.15753
>> for further information)
>>
>> Basically crda doesn't build because it needs python-m2crypto,
>> i've
>> installed it via apt-get and everything was fine then.
>> This is not documented in [1], [2] nor in [3].
>>
>> After digging a bit I found that the CRDA recipe comes from
>> arago-distro-extras, but it can be found in
>> meta-openembedded/meta-networking (on master, not on danny branch)
>> as
>> well. Looking at [4], it seems this version would have this
>> dependency
>> built by bitbake (python-m2crypto-native), again python-m2crypto-
>> native
>> is available only on master, not on danny.
>
> In the meta-arago danny branch there is a python-m2crypto recipe
> that extends native. So can you add the DEPENDS on
> python-m2crypto-native to the crda recipe with danny and have this
> work? Is that the solution you  are mentioning?

You are right, and actually crda (from meta-arago) already depends on
python-m2crypto-native.
Anyway, it doesn't seem to be enough as my build failed, and I had to
install my distro version of python-m2crypto to fix this (unless it got
fixed as a side effect of re-running bitbake).

I might clean and rebuild everything, I thought I could update the
layers without rebuilding everything from scratch, in theory it should
work, but in practice I'm not sure it does, as I had a couple of issues
(after my last update) that doesn't make sense to others (BlueZ version
issue, Qt  and now crda).

Thanks,
Chris

>>
>> Do you want me to open a bug report somewhere?
>>
>> Regards,
>> Chris
>>
>> [1]
>> http://www.yoctoproject.org/docs/1.1/yocto-project-qs/yocto-
>> project-qs.html
>> [2]
>> http://arago-
>> project.org/wiki/index.php/Setting_Up_Build_Environment#Host_tools
>> [3] http://www.openembedded.org/wiki/Getting_started
>> [4]
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE72E8378B6DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">BTW, m2crypto seems to be broken in meta-arago, if I remem=
ber correctly, as I had to install my host package too...<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Christian Gagneraud [chgans@gna.org]<br>
<b>Received:</b> Tuesday, 16 Jul 2013, 17:28<br>
<b>To:</b> Maupin, Chase [chase.maupin@ti.com]<br>
<b>CC:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> Re: [meta-arago] [arago/yocto-1.3] crda and python-m2crypto=
<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On 17/07/13 00:58, Maupin, Chase wrote:<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: meta-arago-bounces@arago-project.org [<a href=3D""></a>mailt=
o:meta-arago-<br>
&gt;&gt; bounces@arago-project.org] On Behalf Of Christian Gagneraud<br>
&gt;&gt; Sent: Monday, July 15, 2013 12:21 AM<br>
&gt;&gt; To: meta-arago@arago-project.org<br>
&gt;&gt; Subject: [meta-arago] [arago/yocto-1.3] crda and python-m2crypto<b=
r>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; While building an image with arago-stable/yocto-1.3, I encountered=
<br>
&gt;&gt; an error:<br>
&gt;&gt; DEBUG: Executing shell function do_compile<br>
&gt;&gt; NOTE: make -j 8 MAKEFLAGS=3D all_noverify<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; GEN&nbsp; keys-gcrypt.c<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; CC&nbsp;&nbsp; crda.o<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; CC&nbsp;&nbsp; intersect.o<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; Trusted pubkeys: pubkeys/linville.key.pub.pem<br=
>
&gt;&gt;&nbsp;&nbsp;&nbsp; CC&nbsp;&nbsp; print-regdom.o<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; CC&nbsp;&nbsp; regdbdump.o<br>
&gt;&gt; ERROR: Failed to import the &quot;M2Crypto&quot; module: No module=
 named<br>
&gt;&gt; M2Crypto<br>
&gt;&gt; Please install the &quot;M2Crypto&quot; Python module.<br>
&gt;&gt; On Debian GNU/Linux the package is called &quot;python-m2crypto&qu=
ot;.<br>
&gt;&gt; make: *** [keys-gcrypt.c] Error 1<br>
&gt;&gt; make: *** Waiting for unfinished jobs....<br>
&gt;&gt; ERROR: oe_runmake failed<br>
&gt;&gt; ERROR: Function failed: do_compile (see<br>
&gt;&gt; /home/christiaga/projects/yocto/arago/build/arago-tmp-external-<br=
>
&gt;&gt; linaro-toolchain/work\<br>
&gt;&gt; /armv7ahf-vfp-neon-oe-linux-gnueabi/crda-1.1.1-<br>
&gt;&gt; r0/temp/log.do_compile.15753<br>
&gt;&gt; for further information)<br>
&gt;&gt;<br>
&gt;&gt; Basically crda doesn't build because it needs python-m2crypto,<br>
&gt;&gt; i've<br>
&gt;&gt; installed it via apt-get and everything was fine then.<br>
&gt;&gt; This is not documented in [1], [2] nor in [3].<br>
&gt;&gt;<br>
&gt;&gt; After digging a bit I found that the CRDA recipe comes from<br>
&gt;&gt; arago-distro-extras, but it can be found in<br>
&gt;&gt; meta-openembedded/meta-networking (on master, not on danny branch)=
<br>
&gt;&gt; as<br>
&gt;&gt; well. Looking at [4], it seems this version would have this<br>
&gt;&gt; dependency<br>
&gt;&gt; built by bitbake (python-m2crypto-native), again python-m2crypto-<=
br>
&gt;&gt; native<br>
&gt;&gt; is available only on master, not on danny.<br>
&gt;<br>
&gt; In the meta-arago danny branch there is a python-m2crypto recipe<br>
&gt; that extends native. So can you add the DEPENDS on<br>
&gt; python-m2crypto-native to the crda recipe with danny and have this<br>
&gt; work? Is that the solution you&nbsp; are mentioning?<br>
<br>
You are right, and actually crda (from meta-arago) already depends on <br>
python-m2crypto-native.<br>
Anyway, it doesn't seem to be enough as my build failed, and I had to <br>
install my distro version of python-m2crypto to fix this (unless it got <br=
>
fixed as a side effect of re-running bitbake).<br>
<br>
I might clean and rebuild everything, I thought I could update the <br>
layers without rebuilding everything from scratch, in theory it should <br>
work, but in practice I'm not sure it does, as I had a couple of issues <br=
>
(after my last update) that doesn't make sense to others (BlueZ version <br=
>
issue, Qt&nbsp; and now crda).<br>
<br>
Thanks,<br>
Chris<br>
<br>
&gt;&gt;<br>
&gt;&gt; Do you want me to open a bug report somewhere?<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Chris<br>
&gt;&gt;<br>
&gt;&gt; [1]<br>
&gt;&gt; <a href=3D"http://www.yoctoproject.org/docs/1.1/yocto-project-qs/y=
octo-">http://www.yoctoproject.org/docs/1.1/yocto-project-qs/yocto-</a><br>
&gt;&gt; project-qs.html<br>
&gt;&gt; [2]<br>
&gt;&gt; <a href=3D"http://arago-">http://arago-</a><br>
&gt;&gt; project.org/wiki/index.php/Setting_Up_Build_Environment#Host_tools=
<br>
&gt;&gt; [3] <a href=3D"http://www.openembedded.org/wiki/Getting_started">h=
ttp://www.openembedded.org/wiki/Getting_started</a><br>
&gt;&gt; [4]<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-arago mailing list<br>
&gt;&gt; meta-arago@arago-project.org<br>
&gt;&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-=
arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
<br>
_______________________________________________<br>
meta-arago mailing list<br>
meta-arago@arago-project.org<br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E8378B6DLEE08entticom_--
