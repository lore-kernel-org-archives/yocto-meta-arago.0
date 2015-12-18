Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by arago-project.org (Postfix) with ESMTPS id 41D0952A3A
	for <meta-arago@arago-project.org>;
	Fri, 18 Dec 2015 09:27:19 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id v36so28404031qgd.2
	for <meta-arago@arago-project.org>;
	Fri, 18 Dec 2015 01:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5n3MU1Zj2M9e0+qmyoIZ4qUzidkZQuqfl3FFNdK3sXA=;
	b=lr4TWla6bLU6jexsfeSSoWYa5kZ7mqhhJT6KrgJUUuhLk8/DUQlmxauAveJeqIADEK
	At90ydhkXFibei/dpO/BI3lfQmFga9IGhKFSY+txlp1ViF/8F0G6/K2pVrRdpZU2fizO
	+2l8wJAuhFvuVTYhKf2GKvvN9BPJenYcBodAbC3wjV3/xiQPNefouJ5Q9qdSaahY2P59
	KCXzT049QRv+Und7MnuYtn/m/VZHAJ/wSjHLLhkAgU3VCNlTYpDpF4FxkIws9OBJ3Zet
	O/hSIaIo4jxt63TMjtJEU66eAqU2F5keXdqOugBW7h2/YWsHfvxfLbRNC9da50XMnzWa
	rykQ==
MIME-Version: 1.0
X-Received: by 10.140.165.16 with SMTP id l16mr3575840qhl.101.1450430838118;
	Fri, 18 Dec 2015 01:27:18 -0800 (PST)
Received: by 10.55.114.6 with HTTP; Fri, 18 Dec 2015 01:27:18 -0800 (PST)
In-Reply-To: <CADnUhn0tvXObVAai0r9W3Ywr6jmfryBbHSSe2kjPehTPGekKCQ@mail.gmail.com>
References: <CADnUhn2v6yOE8JBsoLxpCZaGkO_GZMWme-K2d7SDUbHF-D-Ouw@mail.gmail.com>
	<CADnUhn0tvXObVAai0r9W3Ywr6jmfryBbHSSe2kjPehTPGekKCQ@mail.gmail.com>
Date: Fri, 18 Dec 2015 11:27:18 +0200
Message-ID: <CADnUhn3iEzEq9wuo86eciPpAfp+KrEhFob8dhPCTYikEaqt7sA@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: "broken dt data from edma" message while booting linux-ti-staging-rt-4.1
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
X-List-Received-Date: Fri, 18 Dec 2015 09:27:20 -0000
Content-Type: multipart/alternative; boundary=001a11355e70e0a04b052728be08

--001a11355e70e0a04b052728be08
Content-Type: text/plain; charset=UTF-8

Problem was device tree.
4.1 seems to be more accurate with dtb parsing.
Status = okay  definitions were missing in Ethernet structures.

-Matti

2015-12-16 18:05 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:

> Those " broken dt data" lines are not the problem. They seem to exist also
> in normal 3.14 boot without problems. Two clear differences are: there is
> no nand flash memory mapping and that there is that SIOCGIFFLAGS.
>
> Perhaps I try normal 4.1 kernel also. I used to get it running before.
>
> - Matti
>
> 2015-12-16 14:48 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:
>
>> Hi!
>>
>> I have seen nightly builds of fido RT passing quite consistently.
>> However, I got nasty error messages while my am335x booted
>> linux-ti-staging-rt-4.1 as follows:
>>
>> [    0.146612] omap_hwmod: tptc0 using broken dt data from edma
>> [    0.146751] omap_hwmod: tptc1 using broken dt data from edma
>> [    0.146868] omap_hwmod: tptc2 using broken dt data from edma
>> [    0.151906] omap_hwmod: debugss: _wait_target_disable failed
>>
>> Perhaps for this reason I also get:
>> Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such device
>>
>> and
>>
>> Failed to get index for interface name 'eth0': No such device
>>
>> - so I don't get Ethernet up and running.
>>
>> I have used Yocto version of meta-ti (fido).
>>
>> I found
>> https://www.mail-archive.com/linux-omap@vger.kernel.org/msg116472.html
>> discussing this problem, but I did not these changes made in am33xx.dtsi.
>>
>> What patches should I need to get rt-4.1 running properly?
>>
>> Thanks,
>> Matti
>>
>
>

--001a11355e70e0a04b052728be08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Problem was device tree.<br></div>4.1 seems=
 to be more accurate with dtb parsing.<br></div>Status =3D okay=C2=A0 defin=
itions were missing in Ethernet structures.<br><br></div>-Matti<br></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">2015-12-16 18:05 GM=
T+02:00 matti kaasinen <span dir=3D"ltr">&lt;<a href=3D"mailto:matti.kaasin=
en@gmail.com" target=3D"_blank">matti.kaasinen@gmail.com</a>&gt;</span>:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div>Those &quot; bro=
ken dt data&quot; lines are not the problem. They seem to exist also in nor=
mal 3.14 boot without problems. Two clear differences are: there is no nand=
 flash memory mapping and that there is that SIOCGIFFLAGS.<br><br></div>Per=
haps I try normal 4.1 kernel also. I used to get it running before.<span cl=
ass=3D"HOEnZb"><font color=3D"#888888"><br><br></font></span></div><span cl=
ass=3D"HOEnZb"><font color=3D"#888888">- Matti<br></font></span></div><div =
class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">2015-12-16 14:48 GMT+02:00 matti kaasinen <span dir=3D"lt=
r">&lt;<a href=3D"mailto:matti.kaasinen@gmail.com" target=3D"_blank">matti.=
kaasinen@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div d=
ir=3D"ltr"><div><div>Hi!<br><br>I have seen nightly builds of fido RT passi=
ng quite consistently. However, I got nasty error messages while my am335x =
booted linux-ti-staging-rt-4.1 as follows: <br><br>[=C2=A0=C2=A0=C2=A0 0.14=
6612] omap_hwmod: tptc0 using broken dt data from edma<br>[=C2=A0=C2=A0=C2=
=A0 0.146751] omap_hwmod: tptc1 using broken dt data from edma<br>[=C2=A0=
=C2=A0=C2=A0 0.146868] omap_hwmod: tptc2 using broken dt data from edma<br>=
[=C2=A0=C2=A0=C2=A0 0.151906] omap_hwmod: debugss: _wait_target_disable fai=
led<br><br></div>Perhaps for this reason I also get:<br>Configuring network=
 interfaces... ifconfig: SIOCGIFFLAGS: No such device<br><br></div>and<br><=
br><div><div>Failed to get index for interface name &#39;eth0&#39;: No such=
 device<br><br></div><div>- so I don&#39;t get Ethernet up and running.<br>=
<br></div><div>I have used Yocto version of meta-ti (fido).<br><br></div><d=
iv>I found <a href=3D"https://www.mail-archive.com/linux-omap@vger.kernel.o=
rg/msg116472.html" target=3D"_blank">https://www.mail-archive.com/linux-oma=
p@vger.kernel.org/msg116472.html</a><br></div><div>discussing this problem,=
 but I did not these changes made in am33xx.dtsi.<br><br></div><div>What pa=
tches should I need to get rt-4.1 running properly?<br><br></div><div>Thank=
s,<br></div><div>Matti<br></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a11355e70e0a04b052728be08--
