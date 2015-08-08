Return-Path: <srinivasan.rns@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by arago-project.org (Postfix) with ESMTPS id 7880B52987
	for <meta-arago@arago-project.org>;
	Sat,  8 Aug 2015 09:18:10 +0000 (UTC)
Received: by iodd187 with SMTP id d187so131852910iod.2
	for <meta-arago@arago-project.org>;
	Sat, 08 Aug 2015 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=dnEV+AU8DJr8/YU191iPETLh0pkBcqI8fs2QQ1/C2kU=;
	b=mWH8kNT/Q5nMuUXUSvKIJAMu83HTWI80sb/B/xol7j3qfjTzeow6BfM/mksC1+6ihn
	oFsu1K/+WcBwZNP1QIt8g6oYYZbocg5Id7ChaNxoSf9Yu+xREYjArmPFN6cjbyHIDGBz
	n/jZfXZ5GAJVMk+NSnVHRRNTciJ8PN3mJSjRsL4tFsy5y0onI/jh4bqniBAZFJZHmqSI
	IQpbAGPcyA6mVv0YFbJrad2uWaq3bUOsjwohf60GLg0MCdFUisLY0+OPVxvko7VGNZPa
	76sf2aJOdwZtxk4uf9/92i+lu52OTYc956O9MuXUG0qyDW9/0itkcTNxIee4E2+bukGx
	Mdag==
MIME-Version: 1.0
X-Received: by 10.107.170.212 with SMTP id g81mr11749985ioj.79.1439025489709; 
	Sat, 08 Aug 2015 02:18:09 -0700 (PDT)
Received: by 10.36.64.142 with HTTP; Sat, 8 Aug 2015 02:18:09 -0700 (PDT)
Date: Sat, 8 Aug 2015 14:48:09 +0530
Message-ID: <CAFsTbWc-hJV7M5zWhQbxAkM3v3zihxNAPvBBuA=Wj+76_qdtKw@mail.gmail.com>
From: srinivasan <srinivasan.rns@gmail.com>
To: meta-ti@yoctoproject.org, meta-arago@arago-project.org, 
	"srinivasan.s" <srinivasan.s@tataelxsi.co.in>
Subject: Alsa related configuration & libraries from ti sdk 7 to ti sdk 8
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
X-List-Received-Date: Sat, 08 Aug 2015 09:18:10 -0000
Content-Type: multipart/alternative; boundary=001a11425b70231046051cc93bec

--001a11425b70231046051cc93bec
Content-Type: text/plain; charset=UTF-8

Dear Meta Ti community,

Am trying to run the voip calls with ti sdk 8 BSP's it doesn't work
consistently

But when I move *ti sdk 8 kernel with ti sdk 7 rootfs, *it works
consistently

Now am planning to replace all the alsa related configuration files &
libraries with ti sdk 7 rootfs in ti sdk 8 rootfs

Could anybody please let me know what are all alsa related stuffs that can
be replaced from ti sdk 7 to ti sdk 8 rootfs

Could anybody please list the names of alsa related configurations & the
names of the libraries (along with their paths) & anyother alsa related
stuffs in rootfs that can be moved from ti sdk 7 to ti sdk 8

In order to get voip calls working consistently

Could anybody please provide any inputs w.r.t the above query ie., am
planning to copy all audio & alsa related configuration from ti sdk 7
rootfs to ti sdk 8 rootfs

*Could you please let me know is there any thing apart from the below needs
to copied (audio/alsa related) from ti sdk 7 rootfs to ti sdk 8 rootfs*

1. AlSA configuration files

usr/share/alsa

2.
/usr/lib/libasound.la

/usr/lib/libasound.so

/usr/lib/alsa-lib/smixer/smixer-ac97.la

/usr/lib/alsa-lib/smixer/smixer-ac97.so

/usr/lib/alsa-lib/smixer/smixer-hda.la

/usr/lib/alsa-lib/smixer/smixer-hda.so

/usr/lib/alsa-lib/smixer/smixer-sbase.la

/usr/lib/alsa-lib/smixer/smixer-sbase.so

Kindly do the needful as early as possible

Awaiting for your replies

Many Thanks in advance

--001a11425b70231046051cc93bec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px 0px 1.5em;line-height:1.35em;font-s=
ize:14px;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,Helvetic=
a,Arial,sans-serif">Dear Meta Ti=C2=A0community,</p><p style=3D"margin:1.5e=
m 0px;line-height:1.35em;font-size:14px;color:rgb(85,85,85);font-family:&#3=
9;Source Sans Pro&#39;,Helvetica,Arial,sans-serif">Am trying to run the voi=
p calls with ti sdk 8 BSP&#39;s it doesn&#39;t work consistently</p><p styl=
e=3D"margin:1.5em 0px;line-height:1.35em;font-size:14px;color:rgb(85,85,85)=
;font-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,sans-serif">But when=
 I move=C2=A0<b>ti sdk 8 kernel with ti sdk 7 rootfs,=C2=A0</b>it works con=
sistently</p><p style=3D"margin:1.5em 0px;line-height:1.35em;font-size:14px=
;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,=
sans-serif">Now am planning to replace all the alsa related configuration f=
iles &amp; libraries with ti sdk 7 rootfs in ti sdk 8 rootfs</p><p style=3D=
"margin:1.5em 0px;line-height:1.35em;font-size:14px;color:rgb(85,85,85);fon=
t-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,sans-serif">Could anybod=
y please let me know what are all alsa related stuffs that can be replaced =
from ti sdk 7 to ti sdk 8 rootfs</p><p style=3D"margin:1.5em 0px;line-heigh=
t:1.35em;font-size:14px;color:rgb(85,85,85);font-family:&#39;Source Sans Pr=
o&#39;,Helvetica,Arial,sans-serif">Could anybody please list the names of a=
lsa related configurations &amp; the names of the libraries (along with the=
ir paths) &amp; anyother alsa related stuffs in rootfs that can be moved fr=
om ti sdk 7 to ti sdk 8</p><p style=3D"margin:1.5em 0px;line-height:1.35em;=
font-size:14px;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,He=
lvetica,Arial,sans-serif"><span style=3D"line-height:1.35em">In order to ge=
t voip calls working consistently</span><br></p><p style=3D"margin:1.5em 0p=
x;line-height:1.35em;font-size:14px;color:rgb(85,85,85);font-family:&#39;So=
urce Sans Pro&#39;,Helvetica,Arial,sans-serif"><span style=3D"font-size:12p=
x">Could anybody please provide any inputs w.r.t the above query ie., am pl=
anning to copy all audio &amp; alsa related configuration from ti sdk 7 roo=
tfs to ti sdk 8 rootfs</span></p><p style=3D"margin:1.5em 0px;line-height:1=
.35em;font-size:14px;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#=
39;,Helvetica,Arial,sans-serif"><b>Could you please let me know is there an=
y thing apart from the below needs to copied (audio/alsa related) from ti s=
dk 7 rootfs to ti sdk 8 rootfs</b></p><p style=3D"margin:1.5em 0px;line-hei=
ght:1.35em;font-size:14px;color:rgb(85,85,85);font-family:&#39;Source Sans =
Pro&#39;,Helvetica,Arial,sans-serif"></p><p style=3D"margin:1.5em 0px;line-=
height:1.35em;font-size:14px;color:rgb(85,85,85);font-family:&#39;Source Sa=
ns Pro&#39;,Helvetica,Arial,sans-serif">1. AlSA configuration files</p><p s=
tyle=3D"margin:1.5em 0px;line-height:1.35em;font-size:14px;color:rgb(85,85,=
85);font-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,sans-serif">usr/s=
hare/alsa</p><p style=3D"margin:1.5em 0px;line-height:1.35em;font-size:14px=
;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,=
sans-serif"></p><p style=3D"margin:1.5em 0px;line-height:1.35em;font-size:1=
4px;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,Helvetica,Ari=
al,sans-serif">2.=C2=A0<br>/usr/lib/<a href=3D"http://libasound.la">libasou=
nd.la</a></p><p style=3D"margin:1.5em 0px;line-height:1.35em;font-size:14px=
;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,=
sans-serif">/usr/lib/libasound.so</p><p style=3D"margin:1.5em 0px;line-heig=
ht:1.35em;font-size:14px;color:rgb(85,85,85);font-family:&#39;Source Sans P=
ro&#39;,Helvetica,Arial,sans-serif">/usr/lib/alsa-lib/smixer/<a href=3D"htt=
p://smixer-ac97.la">smixer-ac97.la</a></p><p style=3D"margin:1.5em 0px;line=
-height:1.35em;font-size:14px;color:rgb(85,85,85);font-family:&#39;Source S=
ans Pro&#39;,Helvetica,Arial,sans-serif">/usr/lib/alsa-lib/smixer/smixer-ac=
97.so</p><p style=3D"margin:1.5em 0px;line-height:1.35em;font-size:14px;col=
or:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,sans=
-serif">/usr/lib/alsa-lib/smixer/<a href=3D"http://smixer-hda.la">smixer-hd=
a.la</a></p><p style=3D"margin:1.5em 0px;line-height:1.35em;font-size:14px;=
color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,s=
ans-serif">/usr/lib/alsa-lib/smixer/smixer-hda.so</p><p style=3D"margin:1.5=
em 0px;line-height:1.35em;font-size:14px;color:rgb(85,85,85);font-family:&#=
39;Source Sans Pro&#39;,Helvetica,Arial,sans-serif">/usr/lib/alsa-lib/smixe=
r/<a href=3D"http://smixer-sbase.la">smixer-sbase.la</a></p><p style=3D"mar=
gin:1.5em 0px;line-height:1.35em;font-size:14px;color:rgb(85,85,85);font-fa=
mily:&#39;Source Sans Pro&#39;,Helvetica,Arial,sans-serif">/usr/lib/alsa-li=
b/smixer/smixer-sbase.so</p><p style=3D"margin:1.5em 0px;line-height:1.35em=
;font-size:14px;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,H=
elvetica,Arial,sans-serif"></p><p style=3D"margin:1.5em 0px;line-height:1.3=
5em;font-size:14px;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39=
;,Helvetica,Arial,sans-serif"></p><p style=3D"margin:1.5em 0px;line-height:=
1.35em;font-size:14px;color:rgb(85,85,85);font-family:&#39;Source Sans Pro&=
#39;,Helvetica,Arial,sans-serif">Kindly do the needful as early as possible=
</p><p style=3D"margin:1.5em 0px;line-height:1.35em;font-size:14px;color:rg=
b(85,85,85);font-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,sans-seri=
f">Awaiting for your replies</p><p style=3D"margin-top:0px;margin-bottom:0p=
x;color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-serif;font-size=
:16px"></p><p style=3D"margin:1.5em 0px;line-height:1.35em;font-size:14px;c=
olor:rgb(85,85,85);font-family:&#39;Source Sans Pro&#39;,Helvetica,Arial,sa=
ns-serif">Many Thanks in advance</p></div>

--001a11425b70231046051cc93bec--
