Return-Path: <heroor@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F41AF52A6C
	for <meta-arago@arago-project.org>;
	Thu, 11 Jul 2013 03:34:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6B3YlaP000995
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2013 22:34:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6B3Ykqa029265
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2013 22:34:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Jul 2013 22:34:46 -0500
Received: from [172.24.81.136] (h81-136.vpn.ti.com [172.24.81.136])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6B3YiNL011644;
	Wed, 10 Jul 2013 22:34:45 -0500
Message-ID: <51DE27D3.6090505@ti.com>
Date: Thu, 11 Jul 2013 09:04:43 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <8EAE6244CE843044A42356038645C8551573366C@DFLE12.ent.ti.com>
	<8EAE6244CE843044A42356038645C85515733685@DFLE12.ent.ti.com>
	<20130710163214.GA16407@edge> <51DE1710.1090305@ti.com>
	<20130711025732.GA26533@denix.org>
In-Reply-To: <20130711025732.GA26533@denix.org>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@ti.com>
Subject: Re: Compiling gcc for A15 in Yocto
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
X-List-Received-Date: Thu, 11 Jul 2013 03:34:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/11/2013 8:27 AM, Denys Dmytriyenko wrote:
> On Thu, Jul 11, 2013 at 07:53:12AM +0530, Siddharth Heroor wrote:
>> On 7/10/2013 10:02 PM, Denys Dmytriyenko wrote:
>>> On Wed, Jul 10, 2013 at 03:52:47PM +0000, Saran, Sajesh Kumar wrote:
>>>> I am not clear in last e-mail.
>>>>
>>>> We are trying to compile gcc for ARM in an X86 Ubuntu machine.
>>>
>>> Sajesh,
>>>
>>> If you use recent recipes in Yocto to build gcc from sources, it doesn't use 
>>> any git or svn repositories any more, but downloads a release tarball. I've 
>>> done it before and there's an easy way to enable it in Arago - just set 
>>> TOOLCHAIN_TYPE=internal
>>>
>>
>> Slightly related question. Is it possible to get tools-sdk as a
>> IMAGE_FEATURE? I haven't been able to do that successfully. We use the
>> Linaro 4.7 as an external toolchain, but having tools-sdk with
>> gcc-linaro-4.7 as the compiler running on the target is very useful.
> 
> Linaro toolchain is a cross-compiler and we use pre-built binaries that are to 
> be run on x86 to generate code for ARM. It won't be possible to run it on the 
> target (ARM). You'd need to compile the toolchain from sources for ARM. That 
> is what Sajesh and Djordje were asking for - to be able to build gcc for the 
> target from sources...
> 

I was looking at meta-linaro/recipes-devtools/gcc. The gcc-linaro*
recipes should allow building the compiler from source with SRC_URI set
to something like
https://launchpad.net/gcc-linaro/4.7/4.7-${RELEASE}/+download/gcc-${PV}-${RELEASE}.tar.bz2.


I want to use the prebuilt cross-compiler to generate an image which has
gcc-linaro-4.7 and corresponding tools-sdk features (i.e autotools,
pkgconfig etc..). That means it downloads the linaro toolchain source
and builds it to run _on the target_.

Right now, bitbake -s | grep gcc gives

gcc                                       :4.5-r49+svnr184907
gcc-cross                                 :4.5-r49+svnr184907
gcc-cross-canadian-arm                    :4.5-r49+svnr184907
gcc-cross-initial                         :4.5-r49+svnr184907
gcc-cross-intermediate                    :4.5-r49+svnr184907
gcc-crosssdk                              :4.5-r49+svnr184907
     :4.7.2-r13
gcc-crosssdk-initial                      :4.5-r49+svnr184907
     :4.7.2-r13
gcc-crosssdk-intermediate                 :4.5-r49+svnr184907
gcc-runtime                               :4.5-r49+svnr184907
gccmakedep                                         1:1.0.2-r3
libgcc                                    :4.5-r49+svnr184907
nativesdk-gcc-runtime                     :4.5-r49+svnr184907
     :4.7.2-r13
nativesdk-libgcc                          :4.5-r49+svnr184907
     :4.7.2-r13

I'm wondering what's the way to override these values (not touching
TOOLCHAIN_EXTERNAL) to allow gcc-linaro-4.7 to be picked up. The
prebuilt toolchain would then build gcc-linaro-4.7 and then add it to
the image.

The rationale is that Cortex A15 devices (like OMAP5/DRA7xx and
Keystone2) are pretty fast. For an individual linux developer, having a
toolchain on the image, makes it trivial to develop software - by
eliminating cross-compiling.

--
Sid

