Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4526252A87
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 15:05:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7JF5dqQ023251;
	Mon, 19 Aug 2013 10:05:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7JF5d0k008415;
	Mon, 19 Aug 2013 10:05:39 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 19 Aug 2013 10:05:39 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Christian Gagneraud <chgans@gna.org>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [meta-arago] [yocto] GCC SVN repo too slow?
Thread-Index: AQHOnKA/XIKDqkH7WkGpWppNCYPaspmcobzA
Date: Mon, 19 Aug 2013 15:05:39 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596CBD0A@DLEE11.ent.ti.com>
References: <5211843D.5060805@gna.org>
	<99393E6E-364E-486D-AAB3-6EB66BB9BF72@gmail.com>
	<5211B27F.9070707@gna.org>
In-Reply-To: <5211B27F.9070707@gna.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 19 Aug 2013 15:05:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Christian Gagneraud
>Sent: Monday, August 19, 2013 12:52 AM
>To: Khem Raj
>Cc: meta-arago@arago-project.org; yocto@yoctoproject.org
>Subject: Re: [meta-arago] [yocto] GCC SVN repo too slow?
>
>CC: meta-arago@arago-project.org
>
>
>On 19/08/13 17:16, Khem Raj wrote:
>>
>> On Aug 18, 2013, at 7:34 PM, Christian Gagneraud
><chgans@gna.org> wrote:
>>
>>> Hi all,
>>>
>>> I'm having problems with the GCC SVN repo being so slow to
>checkout, that svn failed (and so my build too).
>>> I first suspected the proxy we have here, but i tried a
>checkout from an outside machine (but still in New Zealand) and it
>seems the problem comes from gcc.gnu.org.
>>>
>>> I am using the arago layer, which requires
>svn://gcc.gnu.org/svn/gcc/branches;module=3Dgcc-4_5-
>branch;protocol=3Dhttp for gcc-crosssdk-intermediate.
>>>
>>> By slow, I really mean slow: 1 to 2 files are checkout per
>second!?!
>>>
>>> Has anyone encountered the same kind of problems?
>>
>>
>> thats a known issue and one of pressing reasons to not use svn
>version on later versions if you see new recipes
>> best case you could hit a mirror from yocto project and download
>the source mirror
>
>
> From the logs, I can see that bitbake is trying (among others):
>downloads.yoctoproject.org
>sources.openembedded.org
>
>but hits a 404, so it fall-backs to GCC's SVN repo directly.
>
>On the side, from the bitbake logs, I end up with a rather obscure
>error:
>svn: E175002: REPORT of '/svn/gcc/!svn/vcc/default': 200 OK
>(http://gcc.gnu.org)
>
>When trying a checkout manually from the outside machine, it fails
>too,
>but the error message is a bit more friendly:
>svn: REPORT of '/svn/gcc/!svn/vcc/default': Could not read
>response
>body: connection was closed by server (http://gcc.gnu.org)
>
>I found plenty of "black magic" workarounds on the web while
>looking for
>the strange "Error: [...] 200 OK", among them was to increase
>Apache
>time out! Which won't even really solve my problem, because the
>checkout
>will takes hours, if not days!
>
>Right now, I'm really stuck. The only solutions I can think of
>are:
>- Ask kindly Arago not to use GCC code from SVN, or maybe to
>upload an
>archive on yocto/oe mirrors.
>- Check with GNU/GCC guys if they can do something about it (maybe
>it's
>a temporary issue with their server)
>- Wait and see, cross my fingers. :(

I think GCC has a git mirror as well.  I saw that once in that past.  Maybe=
 try that.

>
>Thanks,
>Chris
>
>
>>
>>>
>>> Regards,
>>> Chris
>>> _______________________________________________
>>> yocto mailing list
>>> yocto@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/yocto
>>
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

