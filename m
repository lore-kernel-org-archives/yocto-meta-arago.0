Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by arago-project.org (Postfix) with ESMTPS id E643B52A85
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 16:01:58 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wc20so5816730obb.0
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 09:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Epk+CWLDSv+SXzFu2UVvSXPzzcFCQfZvop+U3wK7p0U=;
	b=hmcPWZOM1Z19lFZdSC3ar2Ojx+oDrMzWuBgEQVdQgCK3YFmh++IUZUkYMzyuBv2Wqc
	WVeeopq3/8AijJufzz0sIYnZBkxIIuQk4xu3RbtEUbAay3LUepbE/1bvHQ3KmpcOE4Ec
	L4yXzQfCEpmel9oWp7yhJCjREnbnx4lHvts2+GauBzkM0dgLeCYFf3ZGNFKl9UBiJd//
	HgF2PHinH4an9np3OaQTDjLM5LDoLTySNr9FjlQ81lVJIJqbyRRjU7c2B0eqWNLOsXuz
	GiEyQxwaNPXox0Y9WfV9YRfli1gOIvbbtAQRiJrF9np4vmEL/i1LRG59UtSoMFosd6sm
	kt1w==
MIME-Version: 1.0
X-Received: by 10.50.36.5 with SMTP id m5mr497654igj.3.1376928118019; Mon, 19
	Aug 2013 09:01:58 -0700 (PDT)
Received: by 10.50.216.195 with HTTP; Mon, 19 Aug 2013 09:01:57 -0700 (PDT)
In-Reply-To: <20130819155307.GA32524@denix.org>
References: <5211843D.5060805@gna.org>
	<99393E6E-364E-486D-AAB3-6EB66BB9BF72@gmail.com>
	<5211B27F.9070707@gna.org> <20130819155307.GA32524@denix.org>
Date: Mon, 19 Aug 2013 09:01:57 -0700
Message-ID: <CAMKF1sphCBCvHAqDOC+sMwM257hBrUUrfNgLrO4YXRp6M9KKoQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailman-Approved-At: Mon, 19 Aug 2013 17:24:50 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: [yocto] GCC SVN repo too slow?
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
X-List-Received-Date: Mon, 19 Aug 2013 16:01:59 -0000
Content-Type: multipart/alternative; boundary=089e013c69c05b230d04e44f0f00

--089e013c69c05b230d04e44f0f00
Content-Type: text/plain; charset=UTF-8

On Monday, August 19, 2013, Denys Dmytriyenko <denis@denix.org> wrote:
> On Mon, Aug 19, 2013 at 05:51:59PM +1200, Christian Gagneraud wrote:
>> CC: meta-arago@arago-project.org
>>
>>
>> On 19/08/13 17:16, Khem Raj wrote:
>> >
>> >On Aug 18, 2013, at 7:34 PM, Christian Gagneraud <chgans@gna.org> wrote:
>> >
>> >>Hi all,
>> >>
>> >>I'm having problems with the GCC SVN repo being so slow to checkout,
that svn failed (and so my build too).
>> >>I first suspected the proxy we have here, but i tried a checkout from
an outside machine (but still in New Zealand) and it seems the problem
comes from gcc.gnu.org.
>> >>
>> >>I am using the arago layer, which requires svn://
gcc.gnu.org/svn/gcc/branches;module=gcc-4_5-branch;protocol=http for
gcc-crosssdk-intermediate.
>> >>
>> >>By slow, I really mean slow: 1 to 2 files are checkout per second!?!
>> >>
>> >>Has anyone encountered the same kind of problems?
>> >
>> >
>> >thats a known issue and one of pressing reasons to not use svn version
on later versions if you see new recipes
>> >best case you could hit a mirror from yocto project and download the
source mirror
>>
>>
>> From the logs, I can see that bitbake is trying (among others):
>> downloads.yoctoproject.org
>> sources.openembedded.org
>>
>> but hits a 404, so it fall-backs to GCC's SVN repo directly.
>>
>> On the side, from the bitbake logs, I end up with a rather obscure error:
>> svn: E175002: REPORT of '/svn/gcc/!svn/vcc/default': 200 OK
>> (http://gcc.gnu.org)
>>
>> When trying a checkout manually from the outside machine, it fails
>> too, but the error message is a bit more friendly:
>> svn: REPORT of '/svn/gcc/!svn/vcc/default': Could not read response
>> body: connection was closed by server (http://gcc.gnu.org)
>>
>> I found plenty of "black magic" workarounds on the web while looking
>> for the strange "Error: [...] 200 OK", among them was to increase
>> Apache time out! Which won't even really solve my problem, because
>> the checkout will takes hours, if not days!
>>
>> Right now, I'm really stuck. The only solutions I can think of are:
>> - Ask kindly Arago not to use GCC code from SVN, or maybe to upload
>> an archive on yocto/oe mirrors.
>> - Check with GNU/GCC guys if they can do something about it (maybe
>> it's a temporary issue with their server)
>> - Wait and see, cross my fingers. :(
>
> Chris,
>
> I'm just wondering why do you even need gcc-4.5? Unless you specifically
use
> gcc-4.5 based toolchain with meta-arago. That is the only reason I keep
> gcc-4.5 recipes in meta-arago to support old products with old toolchains.
> We've moved to 4.7 Linaro quite some time ago - when you use that, you
won't
> need to download 4.5 version.
>
> If you really need gcc-4.5 and it's not just a misconfiguration, then I
have
> a tarball available that can be uploaded to a mirror...
>

Regardless let's mirror it. Send me a URL to clone it
> --
> Denys
>

--089e013c69c05b230d04e44f0f00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, August 19, 2013, Denys Dmytriyenko &lt;<a href=3D"mailto=
:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>&gt; On Mon, Aug 19, 20=
13 at 05:51:59PM +1200, Christian Gagneraud wrote:<br>&gt;&gt; CC: <a href=
=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a><b=
r>
&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; On 19/08/13 17:16, Khem Raj wrote:<br>&gt;=
&gt; &gt;<br>&gt;&gt; &gt;On Aug 18, 2013, at 7:34 PM, Christian Gagneraud =
&lt;<a href=3D"mailto:chgans@gna.org">chgans@gna.org</a>&gt; wrote:<br>&gt;=
&gt; &gt;<br>
&gt;&gt; &gt;&gt;Hi all,<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt;I&#39;m h=
aving problems with the GCC SVN repo being so slow to checkout, that svn fa=
iled (and so my build too).<br>&gt;&gt; &gt;&gt;I first suspected the proxy=
 we have here, but i tried a checkout from an outside machine (but still in=
 New Zealand) and it seems the problem comes from <a href=3D"http://gcc.gnu=
.org">gcc.gnu.org</a>.<br>
&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt;I am using the arago layer, which req=
uires svn://<a href=3D"http://gcc.gnu.org/svn/gcc/branches;module=3Dgcc-4_5=
-branch;protocol=3Dhttp">gcc.gnu.org/svn/gcc/branches;module=3Dgcc-4_5-bran=
ch;protocol=3Dhttp</a> for gcc-crosssdk-intermediate.<br>
&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt;By slow, I really mean slow: 1 to 2 f=
iles are checkout per second!?!<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt;Ha=
s anyone encountered the same kind of problems?<br>&gt;&gt; &gt;<br>&gt;&gt=
; &gt;<br>
&gt;&gt; &gt;thats a known issue and one of pressing reasons to not use svn=
 version on later versions if you see new recipes<br>&gt;&gt; &gt;best case=
 you could hit a mirror from yocto project and download the source mirror<b=
r>
&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; From the logs, I can see that bitbake is t=
rying (among others):<br>&gt;&gt; <a href=3D"http://downloads.yoctoproject.=
org">downloads.yoctoproject.org</a><br>&gt;&gt; <a href=3D"http://sources.o=
penembedded.org">sources.openembedded.org</a><br>
&gt;&gt;<br>&gt;&gt; but hits a 404, so it fall-backs to GCC&#39;s SVN repo=
 directly.<br>&gt;&gt;<br>&gt;&gt; On the side, from the bitbake logs, I en=
d up with a rather obscure error:<br>&gt;&gt; svn: E175002: REPORT of &#39;=
/svn/gcc/!svn/vcc/default&#39;: 200 OK<br>
&gt;&gt; (<a href=3D"http://gcc.gnu.org">http://gcc.gnu.org</a>)<br>&gt;&gt=
;<br>&gt;&gt; When trying a checkout manually from the outside machine, it =
fails<br>&gt;&gt; too, but the error message is a bit more friendly:<br>&gt=
;&gt; svn: REPORT of &#39;/svn/gcc/!svn/vcc/default&#39;: Could not read re=
sponse<br>
&gt;&gt; body: connection was closed by server (<a href=3D"http://gcc.gnu.o=
rg">http://gcc.gnu.org</a>)<br>&gt;&gt;<br>&gt;&gt; I found plenty of &quot=
;black magic&quot; workarounds on the web while looking<br>&gt;&gt; for the=
 strange &quot;Error: [...] 200 OK&quot;, among them was to increase<br>
&gt;&gt; Apache time out! Which won&#39;t even really solve my problem, bec=
ause<br>&gt;&gt; the checkout will takes hours, if not days!<br>&gt;&gt;<br=
>&gt;&gt; Right now, I&#39;m really stuck. The only solutions I can think o=
f are:<br>
&gt;&gt; - Ask kindly Arago not to use GCC code from SVN, or maybe to uploa=
d<br>&gt;&gt; an archive on yocto/oe mirrors.<br>&gt;&gt; - Check with GNU/=
GCC guys if they can do something about it (maybe<br>&gt;&gt; it&#39;s a te=
mporary issue with their server)<br>
&gt;&gt; - Wait and see, cross my fingers. :(<br>&gt;<br>&gt; Chris,<br>&gt=
;<br>&gt; I&#39;m just wondering why do you even need gcc-4.5? Unless you s=
pecifically use<br>&gt; gcc-4.5 based toolchain with meta-arago. That is th=
e only reason I keep<br>
&gt; gcc-4.5 recipes in meta-arago to support old products with old toolcha=
ins.<br>&gt; We&#39;ve moved to 4.7 Linaro quite some time ago - when you u=
se that, you won&#39;t<br>&gt; need to download 4.5 version.<br>&gt;<br>
&gt; If you really need gcc-4.5 and it&#39;s not just a misconfiguration, t=
hen I have<br>&gt; a tarball available that can be uploaded to a mirror...<=
br>&gt;<br><br>Regardless let&#39;s mirror it. Send me a URL to clone it<br=
>
&gt; --<br>&gt; Denys<br>&gt;

--089e013c69c05b230d04e44f0f00--
