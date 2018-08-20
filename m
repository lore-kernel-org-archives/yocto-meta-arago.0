Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by arago-project.org (Postfix) with ESMTPS id D63A652ADF
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 19:26:14 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id s198-v6so27828238oih.11
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qIQUWOaat2ycLvdudIKrWnQAeJXgkhsH3yVxDSTMX4c=;
	b=X4GumN0kI5cIMMsjsdsU8a3DV5Kq7egYO1zkd+F8IN/EdI9KD9cENp0KDVjTPMEXrr
	wp7GAJ3eYUxXj/nCrrYgc2nuh411HeaPVmrk7jhZey74Lrh/ptF96AvapeYEHsD9dANI
	ZcwLyJHyUDI0u/yzxPsC5wgcKpRvPxUpJQKYuKkMHZo7Lbsnv8OI3j1/9SGUJ789p4N/
	ig2UbJJUhLfUQOVBTn9SZULXWvpbFQ5K94EomrUp3QosQlFI5l9yKs41LrB50NUyM+Ob
	MuSmKVFXrHr+B9RLd/wr3Sr4YDlSDAXHhrtIK3VwCuEbwJjuUEpdhQJlFHT/pnz2Ig2m
	R5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qIQUWOaat2ycLvdudIKrWnQAeJXgkhsH3yVxDSTMX4c=;
	b=LdQVDrH2x2huiv4kLMAWznCsmPTZ0AllM0qY1tPrjaRcwXyuSbVio5N0vgu0FSumYE
	olUPveaZda488x3KYXCG0HEZPNOz7Z1dxNq/8ZbLzO7dC5eZo8chtCwUw36SEYpMYrBv
	TbTqvGWe3c5fJXymvgQuRAORBgmRdmVvBjOaiJZa75yhuP6FIp+H//C4tU5/dv44XjWU
	2N+nDkiyCwV7Z7qCGvaTEkZJ6W2AKD8yCveGhYm4Y9W1N/Hc2PwXyojNKpMXe2t6fcc4
	0HUlGa/OW0OlW/rJjeWx7pduYmhptMIOdSrd8xOTxmVY1jT0AK27pcnthy1kLTTp6+z4
	WCIw==
X-Gm-Message-State: AOUpUlEyT/Qq9L9IMkltlQDL/ZvYUh8Ug8hYNf09XT7/1ghgguCFPtZB
	NuL71o/S4wVgKPGU8+IEBCY8mK/VWbSpH2rSNNA=
X-Google-Smtp-Source: AA+uWPypNNSn9i9bhtNqjKmQ9tVqsrqHirJqhOETOlMT6BtBfkUHjse1zMR4KX0K78+z7DodaoNzUhjGzA97EqWvxHA=
X-Received: by 2002:aca:e748:: with SMTP id
	e69-v6mr15935452oih.263.1534793167207; 
	Mon, 20 Aug 2018 12:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <1534756947-24631-1-git-send-email-ankur.tyagi85@gmail.com>
	<20180820182615.GC29422@beryl>
In-Reply-To: <20180820182615.GC29422@beryl>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 21 Aug 2018 07:25:56 +1200
Message-ID: <CADySD0GJ7Z7F7RTbptJD_MUpO=OY6LwZ8Vo9wNgPVrFPyd1nxQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/sumo/master/][PATCH] meta-toolchain-arago-qte: fix TOOLCHAIN_TARGET_TASK
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
X-List-Received-Date: Mon, 20 Aug 2018 19:26:15 -0000
Content-Type: multipart/alternative; boundary="00000000000089093e0573e2e115"

--00000000000089093e0573e2e115
Content-Type: text/plain; charset="UTF-8"

I get this error when running following bitbake command

MACHINE=am335x-evm bitbake -k meta-toolchain-arago-qte
NOTE: Started PRServer with DBfile:
/home/ankur/arago/rocko/oe-layersetup/build/cache/prserv.sqlite3, IP:
127.0.0.1, PORT: 43505, PID: 4653
Loading cache: 100%
|########################################################################################################################################################################|
Time: 0:00:00
Loaded 3529 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'packagegroup-arago-qt5-toolchain-target'

Searched for this package in meta-arago repo also and couldn't found it

ankur@ankur-Latitude-E6520:~/arago/rocko/oe-layersetup/sources/meta-arago$
find . -name "packagegroup-arago-qt5-toolchain-target.bb"
ankur@ankur-Latitude-E6520:~/arago/rocko/oe-layersetup/sources/meta-arago$

Moreover, meta-toolchain-arago-tisdk.bb also includes
'packagegroup-arago-qte-toolchain-target'

packagegroup-arago-qte-toolchain-target.bb includes correct Qt packages
depending upon 'QT_PROVIDER'

Hence this patch.

Regards
Ankur

On Tue, Aug 21, 2018 at 6:27 AM Denys Dmytriyenko <denys@ti.com> wrote:

> NAK - this is incorrect.
>
>
> On Mon, Aug 20, 2018 at 09:22:27PM +1200, Ankur Tyagi wrote:
> > Resolves following error when building meta-toolchain-arago-qte
> > ERROR: Nothing RPROVIDES 'packagegroup-arago-qt5-toolchain-target'
>
> When and how are you getting this error?
>
>
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/meta/
> meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/
> meta-toolchain-arago-qte.bb
> > index fdca2c3..0e0e057 100644
> > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > @@ -1,6 +1,6 @@
> >  # Qt Embedded toolchain
> >  TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-qte-toolchain-host"
> > -TOOLCHAIN_TARGET_TASK ?= "${@base_conditional('QT_PROVIDER', 'qt5',
> 'packagegroup-arago-qt5-toolchain-target',
> 'packagegroup-arago-qte-toolchain-target', d)}"
> > +TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-qte-toolchain-target"
> >  TOOLCHAIN_SUFFIX ?= "-qte-sdk"
> >
> >  require meta-toolchain-arago.bb
> > --
> > 2.7.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>

--00000000000089093e0573e2e115
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">I get this error when running following bitbake command=
</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,san=
s-serif"><br></div><div class=3D"gmail_default"><div class=3D"gmail_default=
" style=3D"font-family:arial,helvetica,sans-serif">MACHINE=3Dam335x-evm bit=
bake -k meta-toolchain-arago-qte</div><div class=3D"gmail_default" style=3D=
"font-family:arial,helvetica,sans-serif">NOTE: Started PRServer with DBfile=
: /home/ankur/arago/rocko/oe-layersetup/build/cache/prserv.sqlite3, IP: 127=
.0.0.1, PORT: 43505, PID: 4653</div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,helvetica,sans-serif">Loading cache: 100% |###############=
###########################################################################=
###########################################################################=
###| Time: 0:00:00</div><div class=3D"gmail_default" style=3D"font-family:a=
rial,helvetica,sans-serif">Loaded 3529 entries from dependency cache.</div>=
<div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-seri=
f">NOTE: Resolving any missing task queue dependencies</div><div class=3D"g=
mail_default" style=3D"font-family:arial,helvetica,sans-serif">ERROR: Nothi=
ng RPROVIDES &#39;packagegroup-arago-qt5-toolchain-target&#39;</div><div st=
yle=3D"font-family:arial,helvetica,sans-serif"><br></div><div style=3D"font=
-family:arial,helvetica,sans-serif">Searched for this package in meta-arago=
 repo also and couldn&#39;t found it</div><div><div><font face=3D"arial, he=
lvetica, sans-serif"><br></font></div><div><font face=3D"arial, helvetica, =
sans-serif">ankur@ankur-Latitude-E6520:~/arago/rocko/oe-layersetup/sources/=
meta-arago$ find . -name &quot;<a href=3D"http://packagegroup-arago-qt5-too=
lchain-target.bb">packagegroup-arago-qt5-toolchain-target.bb</a>&quot;</fon=
t></div><div><font face=3D"arial, helvetica, sans-serif">ankur@ankur-Latitu=
de-E6520:~/arago/rocko/oe-layersetup/sources/meta-arago$=C2=A0</font></div>=
</div><div style=3D"font-family:arial,helvetica,sans-serif"><br></div><div =
style=3D"font-family:arial,helvetica,sans-serif">Moreover, <a href=3D"http:=
//meta-toolchain-arago-tisdk.bb">meta-toolchain-arago-tisdk.bb</a> also inc=
ludes &#39;packagegroup-arago-qte-toolchain-target&#39;</div><div style=3D"=
font-family:arial,helvetica,sans-serif"><br></div><div style=3D"font-family=
:arial,helvetica,sans-serif"><a href=3D"http://packagegroup-arago-qte-toolc=
hain-target.bb">packagegroup-arago-qte-toolchain-target.bb</a> includes cor=
rect Qt packages depending upon &#39;QT_PROVIDER&#39;<br></div><div style=
=3D"font-family:arial,helvetica,sans-serif"><br></div><div style=3D"font-fa=
mily:arial,helvetica,sans-serif">Hence this patch.</div><div style=3D"font-=
family:arial,helvetica,sans-serif"><br></div><div style=3D"font-family:aria=
l,helvetica,sans-serif">Regards</div><div style=3D"font-family:arial,helvet=
ica,sans-serif">Ankur</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr">On Tue, Aug 21, 2018 at 6:27 AM Denys Dmytriyenko &lt;<a href=3D"mail=
to:denys@ti.com">denys@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">NAK - this is incorrect.<br>
<br>
<br>
On Mon, Aug 20, 2018 at 09:22:27PM +1200, Ankur Tyagi wrote:<br>
&gt; Resolves following error when building meta-toolchain-arago-qte<br>
&gt; ERROR: Nothing RPROVIDES &#39;packagegroup-arago-qt5-toolchain-target&=
#39;<br>
<br>
When and how are you getting this error?<br>
<br>
<br>
&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.c=
om" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-arago-extras/recipes-core/meta/<a href=3D"http://meta-toolc=
hain-arago-qte.bb" rel=3D"noreferrer" target=3D"_blank">meta-toolchain-arag=
o-qte.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-arago-extras/recipes-core/meta/<a href=3D"http://met=
a-toolchain-arago-qte.bb" rel=3D"noreferrer" target=3D"_blank">meta-toolcha=
in-arago-qte.bb</a> b/meta-arago-extras/recipes-core/meta/<a href=3D"http:/=
/meta-toolchain-arago-qte.bb" rel=3D"noreferrer" target=3D"_blank">meta-too=
lchain-arago-qte.bb</a><br>
&gt; index fdca2c3..0e0e057 100644<br>
&gt; --- a/meta-arago-extras/recipes-core/meta/<a href=3D"http://meta-toolc=
hain-arago-qte.bb" rel=3D"noreferrer" target=3D"_blank">meta-toolchain-arag=
o-qte.bb</a><br>
&gt; +++ b/meta-arago-extras/recipes-core/meta/<a href=3D"http://meta-toolc=
hain-arago-qte.bb" rel=3D"noreferrer" target=3D"_blank">meta-toolchain-arag=
o-qte.bb</a><br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 # Qt Embedded toolchain<br>
&gt;=C2=A0 TOOLCHAIN_HOST_TASK ?=3D &quot;nativesdk-packagegroup-arago-qte-=
toolchain-host&quot;<br>
&gt; -TOOLCHAIN_TARGET_TASK ?=3D &quot;${@base_conditional(&#39;QT_PROVIDER=
&#39;, &#39;qt5&#39;, &#39;packagegroup-arago-qt5-toolchain-target&#39;, &#=
39;packagegroup-arago-qte-toolchain-target&#39;, d)}&quot;<br>
&gt; +TOOLCHAIN_TARGET_TASK ?=3D &quot;packagegroup-arago-qte-toolchain-tar=
get&quot;<br>
&gt;=C2=A0 TOOLCHAIN_SUFFIX ?=3D &quot;-qte-sdk&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 require <a href=3D"http://meta-toolchain-arago.bb" rel=3D"norefe=
rrer" target=3D"_blank">meta-toolchain-arago.bb</a><br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank">meta=
-arago@arago-project.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago</a><br>
</blockquote></div></div>

--00000000000089093e0573e2e115--
