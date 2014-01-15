Return-Path: <jose.alarcon@kuviovision.com>
Received: from webmail1.louhi.net (webmail.louhi.net [77.240.18.35])
	by arago-project.org (Postfix) with ESMTP id CEFF252A4A
	for <meta-arago@arago-project.org>;
	Wed, 15 Jan 2014 20:05:33 +0000 (UTC)
Received: by webmail1.louhi.net (Postfix, from userid 33)
	id 1C9671C0003; Wed, 15 Jan 2014 22:05:33 +0200 (EET)
To: Denys Dmytriyenko <denys@ti.com>
MIME-Version: 1.0
Date: Wed, 15 Jan 2014 22:05:33 +0200
From: jose.alarcon@kuviovision.com
In-Reply-To: <20140115195005.GC12727@edge>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9E@USNYGRMBX4.raymondcorp.local>
	<62b1a363ad07cbdd9cafc25323c67767@kuviovision.com>
	<20140115195005.GC12727@edge>
Message-ID: <392b5fad8cfe390326ed8c78cc4fd84e@kuviovision.com>
X-Sender: jose.alarcon@kuviovision.com
User-Agent: Louhi Webmail/0.8.4
Cc: meta-arago@arago-project.org
Subject: Re: Old version of ti-ipc package in MCSDK 3.03
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
X-List-Received-Date: Wed, 15 Jan 2014 20:05:34 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit



On 2014-01-15 21:50, Denys Dmytriyenko wrote:
> On Wed, Jan 15, 2014 at 07:34:11PM +0200, 
> jose.alarcon@kuviovision.com wrote:
>> Hello,
>>
>> Last September we found a bug on ti-ipc MessageQ implementation that
>> caused some messages getting lost [1].This bug was fixed on the
>> ipcdev git repo a while ago [2]. However, this fix hasn't made it
>> yet to any MCSDK release. The current version of ti-ipc on MCSDK
>> 3.0.3 is 3.00.04.29. This is also the version which seems to be used
>> in the upcoming 3.1 release...
>>
>> We have cherry picked that fix and it seems to work OK. However, we
>> are still experiencing some issues with the IPC communication (some
>> messages from the DSP to the ARM core get corrupted). Before
>> spending time debugging this, we would like to try upgrading the
>> ti-ipc package, since there seem to be quite man other bug fixes and
>> changes since version 3.00.04.29. We tried building it from the top
>> of the master branch using bitbake but it fails to configure. Is
>> there any newer version of this package that is know to work OK on
>> MCSDK environment?
>>
>> (I posted this question to TI E2E community. I am asking here too in
>> case someone can help out. Apologies for the double posting)
>
> Jose,
>
> There were some attempts to update ipc recipes in meta-ti/meta-arago 
> recently
> for MCSDK, but it hasn't been finished yet. I'm working with MCSDK 
> team and
> I'm hoping this will be resolved by the next major release.

Thanks Denys for the update! We will keep an eye on this list and the 
MCSDK announcements then.

--
Jose

