# @capacitor-community/ar

ARKit and ARCore for capacitor

## Install

```bash
npm install @capacitor-community/ar
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`start(...)`](#start)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => any
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>any</code>

--------------------


### start(...)

```typescript
start(options: SceneOptions) => any
```

| Param         | Type                                                  |
| ------------- | ----------------------------------------------------- |
| **`options`** | <code><a href="#sceneoptions">SceneOptions</a></code> |

**Returns:** <code>any</code>

--------------------


### Interfaces


#### SceneOptions

| Prop            | Type                | Description                                                | Since |
| --------------- | ------------------- | ---------------------------------------------------------- | ----- |
| **`sceneData`** | <code>string</code> | The base64 string of scene. This is only supported on iOS. | 0.0.1 |

</docgen-api>
