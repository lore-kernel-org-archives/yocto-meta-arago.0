Return-Path: <chgans@googlemail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by arago-project.org (Postfix) with ESMTPS id 91136529D0
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 05:52:06 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so3642987pdi.27
	for <meta-arago@arago-project.org>;
	Sun, 18 Aug 2013 22:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=kb9dlaED4BjRy5iKH5I292iTqBOjJd+KxZtkIrDJoNo=;
	b=QUR9GKPyRb+SZNh8bH4F+0VQr2IRDQmZaFzxq+uugCEwSMDIZO5fj289Wb5tEiEnYp
	7IvXA/TJYKNHFMtcJzbZWDUOx0BzdtCBat1uFlRqwPLg2YILxRBwnUSuAxo+FL6eBduJ
	B5EDrk5pdcgVI7a011+l42qoy5s2Bn6SPTFuKP8zGQgrPN6dJTvAN1T3BERlyjIravQo
	fPPS/HE+/7oSIb/fmEOUu7wRYzPnL+1j+h0bTfn1YXpiUPyX5StxMphaC1+6F6VDlNCi
	8UlBty0dmhQZnXg89D/GdqP0JUwwkoLancDaovnhfeT/yZ80bA3k5k+Px3jKokx8m63O
	hBbQ==
X-Received: by 10.66.248.198 with SMTP id yo6mr1155495pac.143.1376891525732;
	Sun, 18 Aug 2013 22:52:05 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225]) by mx.google.com with ESMTPSA id
	qv4sm12846134pbc.16.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 18 Aug 2013 22:52:04 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <5211B27F.9070707@gna.org>
Date: Mon, 19 Aug 2013 17:51:59 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <5211843D.5060805@gna.org>
	<99393E6E-364E-486D-AAB3-6EB66BB9BF72@gmail.com>
In-Reply-To: <99393E6E-364E-486D-AAB3-6EB66BB9BF72@gmail.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	yocto@yoctoproject.org
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
X-List-Received-Date: Mon, 19 Aug 2013 05:52:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

CC: meta-arago@arago-project.org


On 19/08/13 17:16, Khem Raj wrote:
>
> On Aug 18, 2013, at 7:34 PM, Christian Gagneraud <chgans@gna.org> wrote:
>
>> Hi all,
>>
>> I'm having problems with the GCC SVN repo being so slow to checkout, that svn failed (and so my build too).
>> I first suspected the proxy we have here, but i tried a checkout from an outside machine (but still in New Zealand) and it seems the problem comes from gcc.gnu.org.
>>
>> I am using the arago layer, which requires svn://gcc.gnu.org/svn/gcc/branches;module=gcc-4_5-branch;protocol=http for gcc-crosssdk-intermediate.
>>
>> By slow, I really mean slow: 1 to 2 files are checkout per second!?!
>>
>> Has anyone encountered the same kind of problems?
>
>
> thats a known issue and one of pressing reasons to not use svn version on later versions if you see new recipes
> best case you could hit a mirror from yocto project and download the source mirror


 From the logs, I can see that bitbake is trying (among others):
downloads.yoctoproject.org
sources.openembedded.org

but hits a 404, so it fall-backs to GCC's SVN repo directly.

On the side, from the bitbake logs, I end up with a rather obscure error:
svn: E175002: REPORT of '/svn/gcc/!svn/vcc/default': 200 OK 
(http://gcc.gnu.org)

When trying a checkout manually from the outside machine, it fails too, 
but the error message is a bit more friendly:
svn: REPORT of '/svn/gcc/!svn/vcc/default': Could not read response 
body: connection was closed by server (http://gcc.gnu.org)

I found plenty of "black magic" workarounds on the web while looking for 
the strange "Error: [...] 200 OK", among them was to increase Apache 
time out! Which won't even really solve my problem, because the checkout 
will takes hours, if not days!

Right now, I'm really stuck. The only solutions I can think of are:
- Ask kindly Arago not to use GCC code from SVN, or maybe to upload an 
archive on yocto/oe mirrors.
- Check with GNU/GCC guys if they can do something about it (maybe it's 
a temporary issue with their server)
- Wait and see, cross my fingers. :(

Thanks,
Chris


>
>>
>> Regards,
>> Chris
>> _______________________________________________
>> yocto mailing list
>> yocto@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/yocto
>


