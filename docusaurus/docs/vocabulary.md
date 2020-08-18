---
id: vocabulary
title: Vocabulary
---

## IOU payment

A promise of delayed payment; an IOU of 50 EUR at 30 days means that the debtor will pay the amount thirty days later from the moment of transacting.

## Connection

A connection is a relation between two users; it can be sent from one user and answered by another user; once accepted, the uses are connected and they can grant each other credit lines.

## Credit line

A credit line is a relation of trust from one user to another; it means that the user who sent the credit line offer (creditor), trusts the other user (debtor) for IOU payments.

Users can grant credit lines to each other:

<iframe width="560" height="315" src="https://www.youtube.com/embed/ZvkGNWAUu84" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<br/>
Or users can grant one-way credit lines:

<iframe width="560" height="315" src="https://www.youtube.com/embed/a6U0YeNJfJU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Time target

A time target is the number of days after which the debtor will have to settle the debt.

## Credit conversion

A credit conversion occurs when one user allows another to use his/her credit line to transact with all or part of his/her network. For example, A wants to buy something from C, but C does not trust A. If C trusts B, and B trusts A, and B enables credit conversion for C, then A can transact with C. As a result, A will owe B, and B will owe C.

Take a look at how this works:

<iframe width="560" height="315" src="https://www.youtube.com/embed/AQkar143isw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Conversion profile

Default settings for conversion for a credit line; has a [global max.](vocabulary.md#global-conversion-max) and a [single max.](vocabulary.md#single-conversion-max)

## Global conversion max

Determines the maximum amount of conversion credit that can be used on the credit line at any given moment.

## Single conversion max

Default value to be granted to conversion permits; this value can be overridden.

## Conversion permit

Allows a user to use another credit line for payments that has not been granted to him directly; granter grants a permit to a grantee, for a given max. amount and potential additional fee.

## Conversion fee

Describes the extra fee that a granter of a permit can impose on all payments created with the permit that he grants.

## Clearing flexibility

Clearing Flexibility is about offsetting IOUs that have different payment target dates. The higher the Flexibility, the more possibilities there are for clearing to occur.

Take a look on how clearing works:

<iframe width="560" height="315" src="https://www.youtube.com/embed/DR8NyJl1Sjg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Master key

It is a cryptographic key for protection of other keys.

## Privacy level

The privacy level is a level of visibility of the user's data fields (display name, first name, last name, country, birthdate, phone number, email, city, Ethereum address) to other users. It can be:

- **private** - no other user can see this attribute
- **searchable** - other users can find the user by this attribute, but they cannot directly see its value
- **shared** - users that already have a connection active with the user can see the attribute value. Users that are not connected can search the user by this attribute, but cannot see its value
- **visible** - all users can see this attribute
