Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by arago-project.org (Postfix) with ESMTPS id DAE9052A7D
	for <meta-arago@arago-project.org>;
	Wed,  2 Mar 2016 16:03:41 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id bc4so120697694lbc.2
	for <meta-arago@arago-project.org>;
	Wed, 02 Mar 2016 08:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=sA7w0pDM8jyE22967fkBAzeiaisZAbUEkpAQTJ0f2w8=;
	b=Q41+VkIyjL9iKyuhw6mOLtghFbaRlXQgu7tvxXB8S9S2YscbYzDWr4/gMVPbVC9rh7
	wLmhSDWI6+GEExL3yM7jKNpBUy+OY27ygZSjXgw3rKsPLL08F7mISBQUGMpK8CZfmtIm
	cFa2QyrE/wFNFbZyHQHOFImGF6mGemJsnNiO1oBP+53kU8Vc/KnwH6NAMTX/KCBnz/wA
	Kxi3uxQPgzWavyXbKcvVO9QGU59vysgKukSaSDSXcWAZKrlUqFZMpiRnVeaVdxemSjLq
	H4KzDXcHZJ1nktUK1GSDfCefcMNMgK31T2VP4RGOsrPCiedzHSiFI3DUW1YDrdRAH0cv
	z5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=sA7w0pDM8jyE22967fkBAzeiaisZAbUEkpAQTJ0f2w8=;
	b=XxeqkRW8rJfxTgTVz6AeK5mjsqTyMmwITA7QfJE97TR3TcLuLQEVclZQMVxd6Swjv6
	AaIamSs5xBWzogcJ8ataLBw//kc0ONvtpxx3dhABPvc0c4eTyIslDgOFkHkMW1kftzZQ
	N1WxexMoL9ypOyaD9A3J84TZJqiiHewV5srbGHl9u0IJ+N578Z+g2kZjjm8xLgIVmClK
	QYBPPeJOpGu8st2rcn8XMS6NDSwPD9t6nZjl2BL2oQD08tGUfYje1/gJ0Me0fdVvSbR+
	RgPMkoNSfr6BTqoRZMe13ustQynrxQA1vunB4bb0esTIyKR6H1wz9FyHxPXusisrQjZT
	kWBg==
X-Gm-Message-State: AD7BkJK1LmWSSD0clQ/P6pEt1NfgzIaxfXFx3ln2InCMZKzjOagw2LWM9vfYpI2ZBp7zcSQs2ov2sdai9FsVJQ==
MIME-Version: 1.0
X-Received: by 10.112.63.231 with SMTP id j7mr10777012lbs.52.1456934620219;
	Wed, 02 Mar 2016 08:03:40 -0800 (PST)
Received: by 10.25.214.166 with HTTP; Wed, 2 Mar 2016 08:03:40 -0800 (PST)
In-Reply-To: <20160302155255.GE7505@edge>
References: <A78912DB-197C-4868-971C-25C34F2578BF@gmail.com>
	<20160302155255.GE7505@edge>
Date: Wed, 2 Mar 2016 08:03:40 -0800
Message-ID: <CANx9H-AxkQ_ea0bPjQt+HbvLHXjDREuejAOsJPeU3UuoE_0imw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: Plans for jethro?
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
X-List-Received-Date: Wed, 02 Mar 2016 16:03:42 -0000
Content-Type: multipart/alternative; boundary=001a1133d07e7fd3a4052d1306d0

--001a1133d07e7fd3a4052d1306d0
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 2, 2016 at 7:52 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Mon, Feb 29, 2016 at 07:46:29PM -0800, Tim Orling wrote:
> > New to the list; curious if there is a planned schedule for a jethro
> branch?
> >
> > I have some Beagleboard related trees that would appreciate a jethro
> update :)
>
> Hi, Tim, long time no see!
>
> Hope to see you at ELC?


> I just had to answer the same question recently on meta-ti list:
>
> https://lists.yoctoproject.org/pipermail/meta-ti/2016-February/008064.html
>
> "As you can see, we skipped dizzy and jethro releases, as we don't have
> resources to maintain 2 releases per year. I try to keep master up to date
> and
> we plan to intersect the next 2.1 release in April, for which we'll have a
> new
> branch in meta-ti."
>
> If you are asking about meta-arago, then the answer is the same, except
> master
> is currently compatible with Fido, and I will be migrating it to the latest
> code in coming weeks to work with upcoming 2.1 release.
>
>
I expected no different, but had to ask :)

--Tim

--001a1133d07e7fd3a4052d1306d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Mar 2, 2016 at 7:52 AM, Denys Dmytriyenko <span dir=3D"ltr">&lt=
;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Feb 2=
9, 2016 at 07:46:29PM -0800, Tim Orling wrote:<br>
&gt; New to the list; curious if there is a planned schedule for a jethro b=
ranch?<br>
&gt;<br>
&gt; I have some Beagleboard related trees that would appreciate a jethro u=
pdate :)<br>
<br>
</span>Hi, Tim, long time no see!<br>
<br></blockquote><div>Hope to see you at ELC?<br>=C2=A0<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
I just had to answer the same question recently on meta-ti list:<br>
<br>
<a href=3D"https://lists.yoctoproject.org/pipermail/meta-ti/2016-February/0=
08064.html" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject=
.org/pipermail/meta-ti/2016-February/008064.html</a><br>
<br>
&quot;As you can see, we skipped dizzy and jethro releases, as we don&#39;t=
 have<br>
resources to maintain 2 releases per year. I try to keep master up to date =
and<br>
we plan to intersect the next 2.1 release in April, for which we&#39;ll hav=
e a new<br>
branch in meta-ti.&quot;<br>
<br>
If you are asking about meta-arago, then the answer is the same, except mas=
ter<br>
is currently compatible with Fido, and I will be migrating it to the latest=
<br>
code in coming weeks to work with upcoming 2.1 release.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div>I expected no different, but had to ask :)<br><br></=
div><div>--Tim<br></div><div><span class=3D"HOEnZb"><font color=3D"#888888"=
>
</font></span></div></div><br></div></div>

--001a1133d07e7fd3a4052d1306d0--
